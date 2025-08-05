//
//  ResponsesBody.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 01/08/2025.
//

import Foundation

public extension Responses {
    struct Body: Codable {
        /// Whether to run the model response in the background.
        public var background: Bool?
        /// Specify additional output data to include in the model response.
        public var include: [AdditionalOutput]?
        ///
        public var input: String?
        /// A system (or developer) message inserted into the model's context.
        ///
        /// When using along with `previous_response_id`, the instructions from a previous response
        /// will not be carried over to the next response. This makes it simple to swap out system
        /// (or developer) messages in new responses.
        public var instructions: String?
        /// An upper bound for the number of tokens that can be generated for a response, including
        /// visible output tokens and reasoning tokens.
        public var maxOutputTokens: Int?
        /// The maximum number of total calls to built-in tools that can be processed in a response.
        ///
        /// This maximum number applies across all built-in tool calls, not per individual tool.
        /// Any further attempts to call a tool by the model will be ignored.
        public var maxToolCalls: Int?
        /// Set of 16 key-value pairs that can be attached to an object.
        ///
        /// This can be useful for storing additional information about the object in a structured
        /// format, and querying for objects via API or the dashboard.
        ///
        /// Keys are strings with a maximum length of 64 characters. Values are strings with a
        /// maximum length of 512 characters.
        public var metadata: [String: String]?
        /// Model ID used to generate the response.
        public var model: String?
        /// Whether to allow the model to run tool calls in parallel.
        ///
        /// Defaults to `true`.
        public var parallelToolCalls: Bool?
        /// The unique ID of the previous response to the model. Use this to create multi-turn conversations.
        public var previousResponseId: String?
        ///
        public var prompt: String?
        /// Used by OpenAI to cache responses for similar requests to optimize your cache hit rates.
        public var promptCacheKey: String?
        ///
        public var reasoning: String?
        /// A stable identifier used to help detect users of your application that may be violating
        /// OpenAI's usage policies.
        ///
        /// The IDs should be a string that uniquely identifies each user. We recommend hashing
        /// their username or email address, in order to avoid sending us any identifying information.
        public var safetyIdentifier: String?
        /// Specifies the processing type used for serving the request.
        ///
        /// * If set to `auto`, then the request will be processed with the service tier configured
        /// in the Project settings. Unless otherwise configured, the Project will use `default`.
        /// * If set to `default`, then the request will be processed with the standard pricing and
        /// performance for the selected model.
        /// * If set to `flex` or `priority`, then the request will be processed with the corresponding
        /// service tier.
        /// * When not set, the default behavior is `auto`.
        ///
        /// When the `service_tier` parameter is set, the response body will include the `service_tier`
        /// value based on the processing mode actually used to serve the request. This response
        /// value may be different from the value set in the parameter.
        public var serviceTier: ServiceTier?
        /// Whether to store the generated model response for later retrieval via API.
        ///
        /// Defaults to `true`.
        public var store: Bool?
        /// If set to true, the model response data will be streamed to the client as it is generated
        /// using server-sent events.
        ///
        /// Defaults to `false`.
        public var stream: Bool?
        /// What sampling temperature to use, between 0 and 2.
        ///
        /// Higher values like 0.8 will make the output more random, while lower values like 0.2
        /// will make it more focused and deterministic. We generally recommend altering this
        /// or `top_p` but not both.
        ///
        /// Defaults to 1.0.
        public var temperature: Double?
        /// An alternative to sampling with temperature, called nucleus sampling, where the model
        /// considers the results of the tokens with top_p probability mass. So 0.1 means only the
        /// tokens comprising the top 10% probability mass are considered.
        ///
        /// We generally recommend altering this or `temperature` but not both.
        public var topP: Double?
        /// The truncation strategy to use for the model response.
        ///
        /// Defaults to `disabled`.
        public var truncation: TruncationStrategy?

        public enum AdditionalOutput: String, Codable, Sendable {
            /// Includes the outputs of python code execution in code interpreter tool call items.
            case codeInterpreterCallOutputs = "code_interpreter_call.outputs"

            /// Include image urls from the computer call output.
            case computerCallOutputImageUrl = "computer_call_output.output.image_url"

            /// Include the search results of the file search tool call.
            case fileSearchCallResults = "file_search_call.results"

            /// Include image urls from the input message.
            case messageInputImageImageUrl = "message.input_image.image_url"

            /// Include logprobs with assistant messages.
            case messageOutputTextLogprobs = "message.output_text.logprobs"

            /// Includes an encrypted version of reasoning tokens in reasoning item outputs.
            ///
            /// This enables reasoning items to be used in multi-turn conversations when using the
            /// Responses API statelessly (like when the store parameter is set to `false`, or when
            /// an organization is enrolled in the zero data retention program).
            case reasoningEncryptedContent = "reasoning.encrypted_content"
        }
    }
}
