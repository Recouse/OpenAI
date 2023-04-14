//
//  OpenAI.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

import EventSource
import Foundation
import os.log

public struct OpenAI {
    private static let baseURL: URL = URL(string: "https://api.openai.com")!
    
    private let apiKey: String
    
    private let jsonDecoder: OAIJSONDecoder = .init()
    
    private let jsonEncoder: OAIJSONEncoder = .init()
    
    public init(apiKey: String) {
        precondition(!apiKey.isEmpty, "API key cannot be empty.")
        self.apiKey = apiKey
    }
    
    public func completions(
        model: ModelType,
        prompt: String,
        suffix: String? = nil,
        maxTokens: Int? = nil,
        temperature: Double? = nil,
        topP: Double? = nil, n: Int? = nil,
        logprobs: Int? = nil,
        echo: Bool = false,
        stop: String? = nil,
        presencePenalty: Double? = nil,
        frequencyPenalty: Double? = nil,
        bestOf: Int? = nil,
        logitBias: [Int: Int]? = nil,
        user: String? = nil
    ) async throws -> Completion.Response {
        let request = Completion.Request(
            model: model,
            prompt: prompt,
            suffix: suffix,
            maxTokens: maxTokens,
            temperature: temperature,
            topP: topP,
            n: n,
            stream: false,
            logprobs: logprobs,
            echo: echo,
            stop: stop,
            presencePenalty: presencePenalty,
            frequencyPenalty: frequencyPenalty,
            bestOf: bestOf,
            logitBias: logitBias,
            user: user
        )

        return try await performRequest(
            for: Completion.Response.self,
            with: urlRequest(request, endpoint: OpenAI.v1.completions, method: .post)
        )
    }
    
    public func completionsStream(
        model: ModelType,
        prompt: String,
        suffix: String? = nil,
        maxTokens: Int? = nil,
        temperature: Double? = nil,
        topP: Double? = nil, n: Int? = nil,
        logprobs: Int? = nil,
        echo: Bool = false,
        stop: String? = nil,
        presencePenalty: Double? = nil,
        frequencyPenalty: Double? = nil,
        bestOf: Int? = nil,
        logitBias: [Int: Int]? = nil,
        user: String? = nil
    ) throws -> AsyncThrowingStream<Completion.Response, Error> {
        let request = Completion.Request(
            model: model,
            prompt: prompt,
            suffix: suffix,
            maxTokens: maxTokens,
            temperature: temperature,
            topP: topP,
            n: n,
            stream: true,
            logprobs: logprobs,
            echo: echo,
            stop: stop,
            presencePenalty: presencePenalty,
            frequencyPenalty: frequencyPenalty,
            bestOf: bestOf,
            logitBias: logitBias,
            user: user
        )

        return performRequestStream(
            for: Completion.Response.self,
            with: try urlRequest(request, endpoint: OpenAI.v1.completions, method: .post)
        )
    }
    
    public func chatCompletions(
        model: ModelType,
        messages: [ChatCompletion.Request.Message],
        temperature: Double? = nil,
        topP: Double? = nil,
        n: Int? = nil,
        stop: ChatCompletion.Request.Stop? = nil,
        maxTokens: Int? = nil,
        presencePenalty: Double? = nil,
        frequencyPenalty: Double? = nil,
        logitBias: [Int: Int]? = nil,
        user: String? = nil
    ) async throws -> ChatCompletion.Response {
        let request = ChatCompletion.Request(
            model: model,
            messages: messages,
            temperature: temperature,
            topP: topP,
            n: n,
            stream: false,
            stop: stop,
            maxTokens: maxTokens,
            presencePenalty: presencePenalty,
            frequencyPenalty: frequencyPenalty,
            logitBias: logitBias,
            user: user
        )
        
        return try await performRequest(
            for: ChatCompletion.Response.self,
            with: urlRequest(request, endpoint: OpenAI.v1.chat.completions, method: .post)
        )
    }
    
    public func chatCompletionsStream(
        model: ModelType,
        messages: [ChatCompletion.Request.Message],
        temperature: Double? = nil,
        topP: Double? = nil,
        n: Int? = nil,
        stop: ChatCompletion.Request.Stop? = nil,
        maxTokens: Int? = nil,
        presencePenalty: Double? = nil,
        frequencyPenalty: Double? = nil,
        logitBias: [Int: Int]? = nil,
        user: String? = nil
    ) throws -> AsyncThrowingStream<ChatCompletion.Chunk, Error> {
        let request = ChatCompletion.Request(
            model: model,
            messages: messages,
            temperature: temperature,
            topP: topP,
            n: n,
            stream: true,
            stop: stop,
            maxTokens: maxTokens,
            presencePenalty: presencePenalty,
            frequencyPenalty: frequencyPenalty,
            logitBias: logitBias,
            user: user
        )
        
        return performRequestStream(
            for: ChatCompletion.Chunk.self,
            with: try urlRequest(request, endpoint: OpenAI.v1.chat.completions, method: .post)
        )
    }
}

extension OpenAI {
    private func urlRequest(
        _ body: Encodable,
        endpoint: Endpoint,
        method: HTTPMethod
    ) throws -> URLRequest {
        let url = Self.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(apiKey)",
            "Content-Type": "application/json"
        ]
        request.httpBody = try jsonEncoder.encode(body)
        return request
    }
    
    func performRequest<T>(
        for model: T.Type,
        with urlRequest: URLRequest
    ) async throws -> T where T: Decodable {
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let parsed = try jsonDecoder.decode(T.self, from: data)
        return parsed
    }
    
    func performRequestStream<T>(
        for model: T.Type,
        with urlRequest: URLRequest
    ) -> AsyncThrowingStream<T, Error> where T: Decodable {
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
                            let model = try self.jsonDecoder.decode(T.self, from: data)
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
}
