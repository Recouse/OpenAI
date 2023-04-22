//
//  ChatCompletionsResponse.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

import Foundation

public extension ChatCompletions {
    struct Response: Decodable, Identifiable {
        public let id: String
        public let object: String
        public let created: Date
        public let model: Model
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
        
        public struct Chunk: Decodable, Identifiable {
            public let id: String
            public let object: String
            public let created: Int
            public let model: Model
            public let choices: [ChunkChoice]
            
            public struct ChunkDelta: Decodable {
                public let content: String?
            }
            
            public struct ChunkChoice: Decodable {
                public let index: Int
                public let delta: ChunkDelta
                public let finishReason: FinishReason?
            }
        }
    }
}
