//
//  ModelsRequest.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 15/04/2023.
//

import Foundation

struct ModelsRequest: Request {
    var method: HTTPMethod = .get
    var host: String
    var version: String = "v1"
    var path: String = "models"
    var headers: HTTPHeaders?
    var body: Data?
    
    init(host: String, headers: HTTPHeaders? = nil) {
        self.host = host
        self.headers = headers
    }
}
