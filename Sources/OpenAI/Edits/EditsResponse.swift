//
//  EditsResponse.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 17/04/2023.
//

public extension Edits {
    struct Response: Decodable {
        public var object: String
        public var created: Int
        public var choices: [Choice]
        public var usage: Usage

        public struct Choice: Decodable {
            public var text: String?
            public var index: Int?
            public var finishReason: String?
        }
    }
}
