//
//  CompletionResponse.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

import Foundation

public extension Completion {
    struct Response: Codable, Identifiable {
        public var id: String
        public var object: String
        public var created: Date
        public var model: ModelType
        public var choices: [Choice]
        public var usage: Usage?
        
        public struct Choice: Codable {
            public var text: String?
            public var index: Int?
            public var finishReason: String?
            
            public init(text: String? = nil, index: Int? = nil, finishReason: String? = nil) {
                self.text = text
                self.index = index
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
