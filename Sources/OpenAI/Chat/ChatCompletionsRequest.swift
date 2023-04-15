//
//  ChatCompletionsRequest.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 14/04/2023.
//

import Foundation

struct ChatCompletionsRequest: Request {
    var method: HTTPMethod = .post
    var path: String = "chat/completions"
    var headers: HTTPHeaders?
    var body: Data?
    
    init(headers: HTTPHeaders? = nil, body: ChatCompletions.Body) {
        self.headers = headers
        self.body = try? Self.encoder.encode(body)
    }
}
