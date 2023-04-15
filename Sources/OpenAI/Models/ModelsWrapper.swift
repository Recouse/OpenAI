//
//  ModelsWrapper.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 15/04/2023.
//

/// List and describe the various models available in the API.
public struct ModelsWrapper {
    let requestHandler: any RequestHandler
    let configuration: OpenAI.Configuration
    
    public func list() async throws -> ModelsResponse {
        let request = ModelsRequest(headers: configuration.headers)
        return try await requestHandler.perform(for: ModelsResponse.self, with: request)
    }
}
