//
//  CompletionsResponse.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

import Foundation

public extension Completions {
    struct Response: Decodable, Identifiable, Sendable {
        public let id: String
        public let object: String
        public let created: Date
        public let model: Model
        public let choices: [Choice]
        public let usage: Usage
        
        public struct Choice: Decodable, Sendable {
            public let text: String?
            public let index: Int?
            public let finishReason: FinishReason?
        }

        public struct Usage: Decodable, Sendable {
            public let completionTokens: Int
            public let completionTokensDetails: CompletionTokensDetails
            public let promptTokens: Int
            public let promptTokensDetails: PromptTokensDetails
            public let totalTokens: Int

            public struct CompletionTokensDetails: Decodable, Sendable {
                public let acceptedPredictionTokens: Int
                public let audioTokens: Int
                public let reasoningTokens: Int
                public let rejectedPredictionTokens: Int
            }

            public struct PromptTokensDetails: Decodable, Sendable {
                public let audioTokens: Int
                public let cachedTokens: Int
            }
        }
    }
}
