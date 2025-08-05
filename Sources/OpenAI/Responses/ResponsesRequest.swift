//
//  ResponsesRequest.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 01/08/2025.
//

import Foundation

struct ResponsesRequest: Request {
    var method: HTTPMethod = .post
    var host: String
    var version: String = "v1"
    var path: String = "responses"
    var headers: HTTPHeaders?
    var body: Data?
    
    init(host: String, headers: HTTPHeaders? = nil, body: Responses.Body) {
        self.host = host
        self.headers = headers
        self.body = try? Self.encoder.encode(body)
    }
}
