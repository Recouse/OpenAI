//
//  EditsRequest.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 17/04/2023.
//

import Foundation

struct EditsRequest: Request {
    var method: HTTPMethod = .post
    var path: String = "edits"
    var headers: HTTPHeaders?
    var body: Data?
    
    init(headers: HTTPHeaders? = nil, body: Edits.Body) {
        self.headers = headers
        self.body = try? Self.encoder.encode(body)
    }
}
