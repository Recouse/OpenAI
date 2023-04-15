//
//  ModelsRequest.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 15/04/2023.
//

import Foundation

struct ModelsRequest: Request {
    var method: HTTPMethod = .get
    var path: String = "models"
    var headers: HTTPHeaders?
    var body: Data?
    
    init(headers: HTTPHeaders? = nil) {
        self.headers = headers
    }
}
