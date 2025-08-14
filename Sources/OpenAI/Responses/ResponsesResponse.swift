//
//  ResponsesResponse.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 01/08/2025.
//

import Foundation

public extension Responses {
    struct StreamingResponse: Decodable, Sendable {
        public let contentIndex: Int?
        public let delta: String?
        public let itemId: String?
        public let outputIndex: Int?
        public let response: Response?
        public let sequenceNumber: Int
        public let text: String?
        public let type: ResponseType

        public enum ResponseType: String, Decodable, Sendable {
            case created = "response.created"
            case inProgress = "response.in_progress"
            case completed = "response.completed"
            case outputTtemAdded = "response.output_item.added"
            case outputItemDone = "response.output_item.done"
            case contentPartAdded = "response.content_part.added"
            case contentPartDone = "response.content_part.done"
            case outputTextDelta = "response.output_text.delta"
            case outputTextDone = "response.output_text.done"
        }

        enum CodingKeys: CodingKey {
            case contentIndex
            case delta
            case itemId
            case outputIndex
            case response
            case sequenceNumber
            case text
            case type
        }

        public init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
            self.contentIndex = try container.decodeIfPresent(Int.self, forKey: .contentIndex)
            self.delta = try container.decodeIfPresent(String.self, forKey: .delta)
            self.itemId = try container.decodeIfPresent(String.self, forKey: .itemId)
            self.outputIndex = try container.decodeIfPresent(Int.self, forKey: .outputIndex)
            self.sequenceNumber = try container.decode(Int.self, forKey: .sequenceNumber)
            self.text = try container.decodeIfPresent(String.self, forKey: .text)
            self.type = try container.decode(ResponseType.self, forKey: .type)

            // Decode only completed response
            if self.type == .completed {
                self.response = try container.decodeIfPresent(Response.self, forKey: .response)
            } else {
                self.response = nil
            }
        }
    }

    struct Response: Decodable, Identifiable, Sendable {
        public let background: Bool?
        public let createdAt: Date
        public let error: ResponseError?
        public let id: String
        public let incompleteDetails: IncompleteDetails?
        // TODO: Implement later
//        public let instructions: String?
        public let maxOutputTokens: Int?
        public let maxToolCalls: Int?
        public let metadata: [String: String]
        public let model: String
        public let object: String
        public let output: [Output]
        public let parallelToolCalls: Bool
        public let previousResponseId: String?
        public let promptCacheKey: String?
        public let safetyIdentifier: String?
        public let serviceTier: ServiceTier?
        public let status: String
        public let temperature: Double?
        public let topLogprobs: Int?
        public let topP: Double?
        public let truncation: TruncationStrategy?
        public let usage: Usage

        /// Convenience property that contains the aggregated text output from all `output_text`
        /// items in the `output` array, if any are present.
        public var outputText: String? {
            output.reduce(into: "") { partialResult, output in
                if output.type == "message" {
                    partialResult += output.content.reduce(into: "") { contentPartialResult, content in
                        if content.type == "output_text" {
                            contentPartialResult += content.text
                        }
                    }
                }
            }
        }

        public struct IncompleteDetails: Decodable, Sendable {
            public let reason: String
        }

        public struct Output: Decodable, Sendable {
            public let id: String
            public let type: String
            public let status: String
            public let content: [Content]
            public let role: Role

            public struct Content: Decodable, Sendable {
                public let type: String
                public let text: String
            }
        }

        public struct Usage: Decodable, Sendable {
            public let inputTokens: Int
            public let inputTokensDetails: InputTokensDetails
            public let outputTokens: Int
            public let outputTokensDetails: OutputTokensDetails
            public let totalTokens: Int

            public struct InputTokensDetails: Decodable, Sendable {
                public let cachedTokens: Int
            }

            public struct OutputTokensDetails: Decodable, Sendable {
                public let reasoningTokens: Int
            }
        }
    }
}
