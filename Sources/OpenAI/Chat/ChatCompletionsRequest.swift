//
//  ChatCompletionsRequest.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 14/04/2023.
//

import Foundation

struct ChatCompletionsRequest: Request {
    var method: HTTPMethod = .post
    var host: String
    var version: String = "v1"
    var path: String = "chat/completions"
    var headers: HTTPHeaders?
    var body: Data?
    
    init(host: String, headers: HTTPHeaders? = nil, body: ChatCompletions.Body) {
        self.host = host
        self.headers = headers
        self.body = try? Self.encoder.encode(body)
    }
}
