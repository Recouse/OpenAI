//
//  ChatWrapper.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 12/04/2023.
//

import Foundation

public struct ChatWrapper {
    let requestHandler: any RequestHandler
    let configuration: OpenAI.Configuration
    
    public func completions(
        model: ChatCompletions.Model,
        messages: [ChatCompletions.Body.Message],
        temperature: Double? = nil,
        topP: Double? = nil,
        n: Int? = nil,
        stop: ChatCompletions.Body.Stop? = nil,
        maxTokens: Int? = nil,
        presencePenalty: Double? = nil,
        frequencyPenalty: Double? = nil,
        logitBias: [Int: Int]? = nil,
        user: String? = nil
    ) async throws -> ChatCompletions.Response {
        let body = ChatCompletions.Body(
            model: model.rawValue,
            messages: messages,
            temperature: temperature,
            topP: topP,
            n: n,
            stream: false,
            stop: stop,
            maxTokens: maxTokens,
            presencePenalty: presencePenalty,
            frequencyPenalty: frequencyPenalty,
            logitBias: logitBias,
            user: user
        )
        
        let request = ChatCompletionsRequest(headers: configuration.headers, body: body)

        return try await requestHandler.perform(for: ChatCompletions.Response.self, with: request)
    }

    public func completionsStream(
        model: ChatCompletions.Model,
        messages: [ChatCompletions.Body.Message],
        temperature: Double? = nil,
        topP: Double? = nil,
        n: Int? = nil,
        stop: ChatCompletions.Body.Stop? = nil,
        maxTokens: Int? = nil,
        presencePenalty: Double? = nil,
        frequencyPenalty: Double? = nil,
        logitBias: [Int: Int]? = nil,
        user: String? = nil
    ) throws -> AsyncThrowingStream<ChatCompletions.Response.Chunk, Error> {
        let body = ChatCompletions.Body(
            model: model.rawValue,
            messages: messages,
            temperature: temperature,
            topP: topP,
            n: n,
            stream: true,
            stop: stop,
            maxTokens: maxTokens,
            presencePenalty: presencePenalty,
            frequencyPenalty: frequencyPenalty,
            logitBias: logitBias,
            user: user
        )
        
        let request = ChatCompletionsRequest(headers: configuration.headers, body: body)

        return requestHandler.stream(for: ChatCompletions.Response.Chunk.self, with: request)
    }
}
