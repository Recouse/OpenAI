//
//  Config.swift
//  OpenAI Example
//
//  Created by Firdavs Khadyarov on 05/08/2025.
//

import Foundation

struct Config {
    static let openAIAPIKey: String? = {
        Bundle.main.object(forInfoDictionaryKey: "OPENAI_API_KEY") as? String
    }()
    
    static let openAIOrganizationID: String? = {
        Bundle.main.object(forInfoDictionaryKey: "OPENAI_ORGANIZATION_ID") as? String
    }()
    
    static var isConfigured: Bool {
        return openAIAPIKey != nil && !openAIAPIKey!.isEmpty && openAIAPIKey != "your_openai_api_key_here"
    }
}
