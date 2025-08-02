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
        audio: AudioRequest? = nil,
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
        responseFormat: ResponseFormat? = nil,
        safetyIdentifier: String? = nil,
        serviceTier: ServiceTier? = nil,
        stop: [String]? = nil,
        store: Bool? = nil,
        temperature: Double? = nil,
        topLogprobs: Int?,
        topP: Double?
    ) async throws -> ChatCompletions.Response {
        let body = ChatCompletions.Body(
            model: model,
            messages: messages,
            audio: audio,
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
            serviceTier: serviceTier,
            stop: stop,
            store: store,
            stream: false,
            temperature: temperature,
            topLogprobs: topLogprobs,
            topP: topP
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
        audio: AudioRequest? = nil,
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
        responseFormat: ResponseFormat? = nil,
        safetyIdentifier: String? = nil,
        serviceTier: ServiceTier? = nil,
        stop: [String]? = nil,
        store: Bool? = nil,
        temperature: Double? = nil,
        topLogprobs: Int?,
        topP: Double?
    ) -> AsyncThrowingStream<ChatCompletions.Response.Chunk, Error> {
        let body = ChatCompletions.Body(
            model: model,
            messages: messages,
            audio: audio,
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
            serviceTier: serviceTier,
            stop: stop,
            store: store,
            stream: true,
            temperature: temperature,
            topLogprobs: topLogprobs,
            topP: topP
        )
        
        let request = ChatCompletionsRequest(
            host: configuration.host,
            headers: configuration.headers,
            body: body
        )

        return requestHandler.stream(for: ChatCompletions.Response.Chunk.self, with: request)
    }
}
