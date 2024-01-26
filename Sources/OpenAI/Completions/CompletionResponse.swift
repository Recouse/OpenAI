//
//  CompletionsResponse.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

import Foundation

public extension Completions {
    struct Response: Decodable, Identifiable {
        public let id: String
        public let object: String
        public let created: Date
        public let model: ChatCompletions.Model
        public let choices: [Choice]
        public let usage: Usage?
        
        public struct Choice: Decodable {
            public let text: String?
            public let index: Int?
            public let finishReason: FinishReason?
        }
    }
}
