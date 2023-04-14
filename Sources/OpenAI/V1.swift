//
//  V1.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

public extension OpenAI {
    struct V1: Endpoint {
        public let path: String
    }
    
    static var v1: V1 {
        .init(path: "/v1")
    }
}
