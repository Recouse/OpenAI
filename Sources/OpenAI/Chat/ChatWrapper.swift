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
        model: Model,
        messages: [ChatCompletions.Body.Message],
        frequencyPenalty: Double? = nil,
        logitBias: [Int: Int]? = nil,
        logprobs: Bool? = nil,
        maxCompletionTokens: Int? = nil,
        metadata: [String: String]? = nil,
        modalities: [Modality]? = nil,
        n: Int? = nil,
        parallelToolCalls: Bool? = nil,
        presencePenalty: Double? = nil,
        promptCacheKey: String? = nil,
        reasoningEffort: Effort? = nil,
        safetyIdentifier: String? = nil,
        stop: [String]? = nil,
        temperature: Double? = nil,
        topP: Double? = nil,
        responseFormat: ResponseFormat? = nil,
    ) async throws -> ChatCompletions.Response {
        let body = ChatCompletions.Body(
            model: model,
            messages: messages,
            frequencyPenalty: frequencyPenalty,
            logitBias: logitBias,
            logprobs: logprobs,
            maxCompletionTokens: maxCompletionTokens,
            metadata: metadata,
            modalities: modalities,
            n: n,
            parallelToolCalls: parallelToolCalls,
            presencePenalty: presencePenalty,
            promptCacheKey: promptCacheKey,
            reasoningEffort: reasoningEffort,
            responseFormat: responseFormat,
            safetyIdentifier: safetyIdentifier,
            stop: stop,
            stream: false
        )
        
        let request = ChatCompletionsRequest(
            host: configuration.host,
            headers: configuration.headers,
            body: body
        )

        return try await requestHandler.perform(for: ChatCompletions.Response.self, with: request)
    }

    public func completionsStream(
        model: Model,
        messages: [ChatCompletions.Body.Message],
        frequencyPenalty: Double? = nil,
        logitBias: [Int: Int]? = nil,
        logprobs: Bool? = nil,
        maxCompletionTokens: Int? = nil,
        metadata: [String: String]? = nil,
        modalities: [Modality]? = nil,
        n: Int? = nil,
        parallelToolCalls: Bool? = nil,
        presencePenalty: Double? = nil,
        promptCacheKey: String? = nil,
        reasoningEffort: Effort? = nil,
        safetyIdentifier: String? = nil,
        stop: [String]? = nil,
        temperature: Double? = nil,
        topP: Double? = nil,
        responseFormat: ResponseFormat? = nil,
    ) -> AsyncThrowingStream<ChatCompletions.Response.Chunk, Error> {
        let body = ChatCompletions.Body(
            model: model,
            messages: messages,
            frequencyPenalty: frequencyPenalty,
            logitBias: logitBias,
            logprobs: logprobs,
            maxCompletionTokens: maxCompletionTokens,
            metadata: metadata,
            modalities: modalities,
            n: n,
            parallelToolCalls: parallelToolCalls,
            presencePenalty: presencePenalty,
            promptCacheKey: promptCacheKey,
            reasoningEffort: reasoningEffort,
            responseFormat: responseFormat,
            safetyIdentifier: safetyIdentifier,
            stop: stop,
            stream: true
        )
        
        let request = ChatCompletionsRequest(
            host: configuration.host,
            headers: configuration.headers,
            body: body
        )

        return requestHandler.stream(for: ChatCompletions.Response.Chunk.self, with: request)
    }
}
