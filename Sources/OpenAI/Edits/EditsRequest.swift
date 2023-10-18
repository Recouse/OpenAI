//
//  EditsRequest.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 17/04/2023.
//

import Foundation

struct EditsRequest: Request {
    var method: HTTPMethod = .post
    var host: String
    var version: String = "v1"
    var path: String = "edits"
    var headers: HTTPHeaders?
    var body: Data?
    
    init(host: String, headers: HTTPHeaders? = nil, body: Edits.Body) {
        self.host = host
        self.headers = headers
        self.body = try? Self.encoder.encode(body)
    }
}
