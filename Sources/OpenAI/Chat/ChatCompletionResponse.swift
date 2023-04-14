//
//  ChatCompletionResponse.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

import Foundation

public extension ChatCompletion {
    struct Response: Decodable, Identifiable {
        public var id: String
        public var object: String
        public var created: Date
        public var model: ModelType
        public var choices: [Choice]
        public var usage: Usage?
        
        public struct Message: Codable {
            /// The role of the author of this message.
            public var role: Role
            /// The contents of the message
            public var content: String

            public init(role: Role, content: String) {
                self.role = role
                self.content = content
            }
        }

        
        public struct Choice: Codable {
            public var index: Int?
            public var message: Message?
            public var finishReason: String?
            
            public init(index: Int? = nil, message: Message? = nil, finishReason: String? = nil) {
                self.index = index
                self.message = message
                self.finishReason = finishReason
            }
        }
        
        public struct Usage: Codable {
            public var promptTokens: Int
            public var completionTokens: Int
            public var totalTokens: Int
            
            public init(promptTokens: Int, completionTokens: Int, totalTokens: Int) {
                self.promptTokens = promptTokens
                self.completionTokens = completionTokens
                self.totalTokens = totalTokens
            }
        }
    }
}
