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
                if case let .message(message) = output {
                    partialResult += message.content.reduce(into: "") { contentPartialResult, content in
                        if content.type == "output_text" {
                            contentPartialResult += content.text ?? ""
                        }
                    }
                }
            }
        }

        public struct IncompleteDetails: Decodable, Sendable {
            public let reason: String
        }

        public enum OutputType: String, Decodable, Sendable {
            case message
            case fileSearchCall = "file_search_call"
            case functionCall = "function_call"
            case webSearchCall = "web_search_call"
            case computerCall = "computer_call"
            case reasoning
            case imageGenerationCall = "image_generation_call"
            case codeInterpreterCall = "code_interpreter_call"
            case localShellCall = "local_shell_call"
            case mcpCall = "mcp_call"
        }

        public enum Output: Decodable, Sendable {
            case message(MessageOutput)
            case fileSearchCall(FileSearchCallOutput)
            case reasoning(ReasoningOutput)

            enum CodingKeys: String, CodingKey {
                case type
            }

            public init(from decoder: any Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                let type = try container.decode(OutputType.self, forKey: .type)
                switch type {
                case .message:
                    let innerContainer = try decoder.singleValueContainer()
                    let message = try innerContainer.decode(MessageOutput.self)
                    self = .message(message)
                case .fileSearchCall:
                    let innerContainer = try decoder.singleValueContainer()
                    let fileSearchCall = try innerContainer.decode(FileSearchCallOutput.self)
                    self = .fileSearchCall(fileSearchCall)
                case .reasoning:
                    let innerContainer = try decoder.singleValueContainer()
                    let reasoning = try innerContainer.decode(ReasoningOutput.self)
                    self = .reasoning(reasoning)
                default:
                    throw OpenAIError.incompatibleModel
                }
            }
        }

        /// An output message from the model.
        public struct MessageOutput: Decodable, Sendable {
            /// The content of the output message.
            public let content: [Content]

            /// The unique ID of the output message.
            public let id: String

            /// The role of the output message. Always `assistant`.
            public let role: Role

            /// The status of the message input. One of `in_progress`, `completed`, or `incomplete`.
            ///
            /// Populated when input items are returned via API.
            public let status: String

            public struct Content: Decodable, Sendable {
                public let type: String
                public let text: String?
            }
        }

        /// The results of a file search tool call.
        public struct FileSearchCallOutput: Decodable, Sendable {
            /// The unique ID of the file search tool call.
            public let id: String

            /// The queries used to search for files.
            public let queries: [String]

            /// The results of the file search tool call.
            public let results: [Result]?

            /// The status of the file search tool call. One of `in_progress`, `searching`,
            /// `incomplete` or `failed`,
            public let status: String

            public struct Result: Decodable, Sendable {
                /// Set of 16 key-value pairs that can be attached to an object.
                ///
                /// This can be useful for storing additional information about the object in a
                /// structured format, and querying for objects via API or the dashboard. Keys are
                /// strings with a maximum length of 64 characters. Values are strings with a
                /// maximum length of 512 characters, booleans, or numbers.
                public let attributes: [String: String]

                /// The unique ID of the file.
                public let fileId: String

                /// The name of the file.
                public let filename: String

                /// The relevance score of the file - a value between 0 and 1.
                public let score: Double

                /// The text that was retrieved from the file.
                public let text: String
            }
        }

        /// A description of the chain of thought used by a reasoning model while generating a
        /// response.
        ///
        /// Be sure to include these items in your input to the Responses API for subsequent
        /// turns of a conversation if you are manually managing context.
        public struct ReasoningOutput: Decodable, Sendable {
            /// Reasoning text content.
            public let content: [Content]?

            /// The encrypted content of the reasoning item - populated when a response is
            /// generated with `reasoning.encrypted_content` in the `include` parameter.
            public let encryptedContent: String?

            /// The unique identifier of the reasoning content.
            public let id: String

            /// The status of the item. One of `in_progress`, `completed`, or `incomplete`.
            ///
            /// Populated when items are returned via API.
            public let status: String?

            /// Reasoning summary content.
            public let summary: [Summary]

            public struct Content: Decodable, Sendable {
                /// Reasoning text output from the model.
                public let text: String

                /// The type of the object. Always `reasoning_text`.
                public let type: String
            }

            public struct Summary: Decodable, Sendable {
                /// A summary of the reasoning output from the model so far.
                public let text: String

                /// The type of the object. Always `summary_text`.
                public let type: String
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
