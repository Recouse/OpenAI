//
//  CompletionsRequest.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 15/04/2023.
//

import Foundation

struct CompletionsRequest: Request {
    var method: HTTPMethod = .post
    var host: String
    var version: String = "v1"
    var path: String = "completions"
    var headers: HTTPHeaders?
    var body: Data?
    
    init(host: String, headers: HTTPHeaders? = nil, body: Completions.Body) {
        self.host = host
        self.headers = headers
        self.body = try? Self.encoder.encode(body)
    }
}
