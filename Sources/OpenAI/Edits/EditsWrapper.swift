//
//  EditsWrapper.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 17/04/2023.
//

public struct EditsWrapper {
    let requestHandler: any RequestHandler
    let configuration: OpenAI.Configuration
    
    public func create(
        model: Edits.Model,
        input: String? = nil,
        instruction: String,
        n: Int? = nil,
        temperature: Double? = nil,
        topP: Double? = nil
    ) async throws -> Edits.Response {
        let body = Edits.Body(
            model: model.rawValue,
            input: input,
            instruction: instruction,
            n: n,
            temperature: temperature,
            topP: topP
        )
        
        let request = EditsRequest(headers: configuration.headers, body: body)

        return try await requestHandler.perform(for: Edits.Response.self, with: request)
    }
}
