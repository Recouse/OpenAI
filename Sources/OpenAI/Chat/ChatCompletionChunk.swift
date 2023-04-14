//
//  ChatCompletionChunk.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 13/04/2023.
//

public extension ChatCompletion {
    struct Chunk: Decodable, Identifiable {
        public var id: String
        public var object: String
        public var created: Int
        public var model: ModelType
        public var choices: [Choice]
        
        public struct Delta: Codable {
            public var role: Role?
            public var content: String?

            public init(role: Role? = nil, content: String? = nil) {
                self.role = role
                self.content = content
            }
        }

        
        public struct Choice: Codable {
            public var index: Int
            public var delta: Delta
            public var finishReason: String?
            
            public init(index: Int, delta: Delta, finishReason: String? = nil) {
                self.index = index
                self.delta = delta
                self.finishReason = finishReason
            }
        }
        
        public init(id: String, object: String, created: Int, model: ModelType, choices: [Choice]) {
            self.id = id
            self.object = object
            self.created = created
            self.model = model
            self.choices = choices
        }
    }
}
