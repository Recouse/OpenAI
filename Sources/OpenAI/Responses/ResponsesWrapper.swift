//
//  ResponsesWrapper.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 01/08/2025.
//

public struct ResponsesWrapper {
    let requestHandler: any RequestHandler
    let configuration: OpenAI.Configuration
    
    public func create(
        background: Bool? = nil,
        include: [Responses.Body.AdditionalOutput]? = nil,
        input: Responses.Body.Input? = nil,
        instructions: String? = nil,
        maxOutputTokens: Int? = nil,
        maxToolCalls: Int? = nil,
        metadata: [String : String]? = nil,
        model: Model? = nil,
        parallelToolCalls: Bool? = nil,
        previousResponseId: String? = nil,
        prompt: Prompt? = nil,
        promptCacheKey: String? = nil,
        reasoning: String? = nil,
        safetyIdentifier: String? = nil,
        serviceTier: ServiceTier? = nil,
        store: Bool? = nil,
        temperature: Double? = nil,
        topP: Double? = nil,
        truncation: TruncationStrategy? = nil,
        user: String? = nil
    ) async throws -> Responses.Response {
        let body = Responses.Body(
            background: background,
            include: include,
            input: input,
            instructions: instructions,
            maxOutputTokens: maxOutputTokens,
            maxToolCalls: maxToolCalls,
            metadata: metadata,
            model: model,
            parallelToolCalls: parallelToolCalls,
            previousResponseId: previousResponseId,
            prompt: prompt,
            promptCacheKey: promptCacheKey,
            reasoning: reasoning,
            safetyIdentifier: safetyIdentifier,
            serviceTier: serviceTier,
            store: store,
            temperature: temperature,
            topP: topP,
            truncation: truncation
        )

        let request = ResponsesRequest(
            host: configuration.host,
            headers: configuration.headers,
            body: body
        )

        return try await requestHandler.perform(for: Responses.Response.self, with: request)
    }

    public func createStream(
        background: Bool? = nil,
        include: [Responses.Body.AdditionalOutput]? = nil,
        input: Responses.Body.Input? = nil,
        instructions: String? = nil,
        maxOutputTokens: Int? = nil,
        maxToolCalls: Int? = nil,
        metadata: [String : String]? = nil,
        model: Model? = nil,
        parallelToolCalls: Bool? = nil,
        previousResponseId: String? = nil,
        prompt: Prompt? = nil,
        promptCacheKey: String? = nil,
        reasoning: String? = nil,
        safetyIdentifier: String? = nil,
        serviceTier: ServiceTier? = nil,
        store: Bool? = nil,
        temperature: Double? = nil,
        topP: Double? = nil,
        truncation: TruncationStrategy? = nil,
        user: String? = nil
    ) -> AsyncThrowingStream<Responses.StreamingResponse, Error> {
        let body = Responses.Body(
            background: background,
            include: include,
            input: input,
            instructions: instructions,
            maxOutputTokens: maxOutputTokens,
            maxToolCalls: maxToolCalls,
            metadata: metadata,
            model: model,
            parallelToolCalls: parallelToolCalls,
            previousResponseId: previousResponseId,
            prompt: prompt,
            promptCacheKey: promptCacheKey,
            reasoning: reasoning,
            safetyIdentifier: safetyIdentifier,
            serviceTier: serviceTier,
            store: store,
            stream: true,
            temperature: temperature,
            topP: topP,
            truncation: truncation
        )

        let request = ResponsesRequest(
            host: configuration.host,
            headers: configuration.headers,
            body: body
        )

        return requestHandler.stream(for: Responses.StreamingResponse.self, with: request)
    }
}
