//
//  CompletionsWrapper.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 12/04/2023.
//

public struct CompletionsWrapper {
    let requestHandler: any RequestHandler
    let configuration: OpenAI.Configuration
    
    public func create(
        model: Completions.Model,
        prompt: [String],
        suffix: String? = nil,
        maxTokens: Int? = nil,
        temperature: Double? = nil,
        topP: Double? = nil, n: Int? = nil,
        logprobs: Int? = nil,
        echo: Bool = false,
        stop: String? = nil,
        presencePenalty: Double? = nil,
        frequencyPenalty: Double? = nil,
        bestOf: Int? = nil,
        logitBias: [Int: Int]? = nil,
        user: String? = nil
    ) async throws -> Completions.Response {
        let body = Completions.Body(
            model: model.rawValue,
            prompt: prompt,
            suffix: suffix,
            maxTokens: maxTokens,
            temperature: temperature,
            topP: topP,
            n: n,
            stream: false,
            logprobs: logprobs,
            echo: echo,
            stop: stop,
            presencePenalty: presencePenalty,
            frequencyPenalty: frequencyPenalty,
            bestOf: bestOf,
            logitBias: logitBias,
            user: user
        )
        
        let request = CompletionsRequest(headers: configuration.headers, body: body)

        return try await requestHandler.perform(for: Completions.Response.self, with: request)
    }

    public func createStream(
        model: Completions.Model,
        prompt: [String],
        suffix: String? = nil,
        maxTokens: Int? = nil,
        temperature: Double? = nil,
        topP: Double? = nil, n: Int? = nil,
        logprobs: Int? = nil,
        echo: Bool = false,
        stop: String? = nil,
        presencePenalty: Double? = nil,
        frequencyPenalty: Double? = nil,
        bestOf: Int? = nil,
        logitBias: [Int: Int]? = nil,
        user: String? = nil
    ) -> AsyncThrowingStream<Completions.Response, Error> {
        let body = Completions.Body(
            model: model.rawValue,
            prompt: prompt,
            suffix: suffix,
            maxTokens: maxTokens,
            temperature: temperature,
            topP: topP,
            n: n,
            stream: true,
            logprobs: logprobs,
            echo: echo,
            stop: stop,
            presencePenalty: presencePenalty,
            frequencyPenalty: frequencyPenalty,
            bestOf: bestOf,
            logitBias: logitBias,
            user: user
        )
        
        let request = CompletionsRequest(headers: configuration.headers, body: body)

        return requestHandler.stream(for: Completions.Response.self, with: request)
    }
}
