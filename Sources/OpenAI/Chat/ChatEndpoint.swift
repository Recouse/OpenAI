//
//  ChatEndpoint.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

public extension OpenAI.V1 {
    struct Chat: Endpoint {
        struct Completions: Endpoint {
            public let path: String
        }
        
        public let path: String
        
        var completions: Completions {
            .init(path: path + "/completions")
        }
    }
    
    var chat: Chat {
        .init(path: path + "/chat")
    }
}
