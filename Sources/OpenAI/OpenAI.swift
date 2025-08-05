//
//  OpenAI.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

import EventSource
import Foundation

public struct OpenAI {
    let configuration: Configuration
    
    let requestHandler: RequestHandler
    
    public let models: ModelsWrapper
    public let completions: CompletionsWrapper
    public let chat: ChatWrapper
    public init(
        apiKey: String? = nil,
        organization: String? = nil,
        host: String = "api.openai.com",
        additionalHeaders: HTTPHeaders = [:]
    ) {
        self.configuration = Configuration(
            apiKey: apiKey,
            organization: organization,
            host: host,
            additionalHeaders: additionalHeaders
        )
        self.requestHandler = BaseRequestHandler()
        self.models = ModelsWrapper(
            requestHandler: self.requestHandler,
            configuration: self.configuration
        )
        self.completions = CompletionsWrapper(
            requestHandler: self.requestHandler,
            configuration: self.configuration
        )
        self.chat = ChatWrapper(
            requestHandler: self.requestHandler,
            configuration: self.configuration
        )
    }
}
