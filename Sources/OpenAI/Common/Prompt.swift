//
//  Prompt.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 08/08/2025.
//

// TODO: Implement file input https://platform.openai.com/docs/guides/text#reusable-prompts

public struct Prompt: Encodable, Sendable {
    /// The unique identifier of the prompt template to use.
    public let id: String

    /// Optional map of values to substitute in for variables in your prompt.
    ///
    /// The substitution values can either be strings, or other Response input types like images or files.
    public let variables: [String: String]?

    /// Optional version of the prompt template.
    public let version: String?

    public init(id: String, variables: [String: String]? = nil, version: String? = nil) {
        self.id = id
        self.variables = variables
        self.version = version
    }
}
