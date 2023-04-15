//
//  BaseRequestHandler.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 14/04/2023.
//

import EventSource
import Foundation
import os.log

public struct BaseRequestHandler: RequestHandler {
    let urlSession: URLSession
    
    let decoder: JSONDecoder = .openAIDecoder
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    public func perform<T>(for model: T.Type, with request: Request) async throws -> T where T: Decodable {
        guard let urlRequest = urlRequest(from: request) else {
            throw OpenAIError.cannotBuildURLRequest
        }
        
        let (data, _) = try await urlSession.data(for: urlRequest)
        let parsed = try decoder.decode(T.self, from: data)
        return parsed
    }
    
    public func stream<T>(
        for model: T.Type,
        with request: Request
    ) -> AsyncThrowingStream<T, Error> where T: Decodable {
        guard let urlRequest = urlRequest(from: request) else {
            return AsyncThrowingStream { continuation in
                continuation.finish(throwing: OpenAIError.cannotBuildURLRequest)
            }
        }
        
        return AsyncThrowingStream { continuation in
            Task {
                let eventSource = EventSource(request: urlRequest)
                eventSource.connect()
                
                for await event in eventSource.events {
                    switch event {
                    case .open:
                        continue
                    case .error(let error):
                        os_log(.debug, "Received an error: %@", error.localizedDescription)
                        continue
                    case .message(let message):
                        guard let stringData = message.data else {
                            continue
                        }
                        
                        if stringData == "[DONE]" {
                            continuation.finish()
                            break
                        }
                        
                        let data = Data(stringData.utf8)
                        do {
                            let model = try self.decoder.decode(T.self, from: data)
                            continuation.yield(model)
                        } catch {
                            continuation.finish(throwing: error)
                        }
                    case .closed:
                        continuation.finish()
                    }
                }
            }
        }
    }
    
    private func urlRequest(from request: Request) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = request.host
        urlComponents.path = [request.version, request.path].joined(separator: "/")
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body
        
        return urlRequest
    }
}
