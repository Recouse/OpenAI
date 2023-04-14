//
//  ChatCompletionChunk.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 13/04/2023.
//

public extension ChatCompletion {
    struct Chunk: Decodable, Identifiable {
        public let id: String
        public let object: String
        public let created: Int
        public let model: ModelType
        public let choices: [Choice]
        
        public struct Delta: Decodable {
            public let role: Role?
            public let content: String?
        }
        
        public struct Choice: Decodable {
            public let index: Int
            public let delta: Delta
            public let finishReason: FinishReason?
        }
    }
}
