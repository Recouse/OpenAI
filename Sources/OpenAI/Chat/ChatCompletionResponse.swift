//
//  ChatCompletionResponse.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

import Foundation

public extension ChatCompletion {
    struct Response: Decodable, Identifiable {
        public let id: String
        public let object: String
        public let created: Date
        public let model: ModelType
        public let choices: [Choice]
        public let usage: Usage?
        
        public struct Message: Decodable {
            /// The role of the author of this message.
            public let role: Role
            /// The contents of the message
            public let content: String
        }

        
        public struct Choice: Decodable {
            public let index: Int?
            public let message: Message?
            public let finishReason: FinishReason?
        }
    }
}
