//
//  OpenAI.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 11/04/2023.
//

import EventSource
import Foundation
import os.log

public struct OpenAI {
    struct Configuration {
        /// Open AI API key
        let apiKey: String
        
        /// Organization ID
        ///
        /// For users who belong to multiple organizations, you can specify which organization
        /// is used for an API request. Usage from these API requests will count against
        /// the specified organization's subscription quota.
        let organization: String?
        
        var headers: HTTPHeaders {
            var headers: HTTPHeaders = [
                "Authorization": "Bearer \(apiKey)"
            ]
            
            if let organization {
                headers["OpenAI-Organization"] = organization
            }
            
            return headers
        }
    }
    
    let configuration: Configuration
    
    let requestHandler: RequestHandler
    
    let chat: ChatWrapper
    
    public init(apiKey: String, organization: String? = nil) {
        precondition(!apiKey.isEmpty, "API key cannot be empty.")
        self.configuration = Configuration(apiKey: apiKey, organization: organization)
        self.requestHandler = BaseRequestHandler()
        self.chat = ChatWrapper(requestHandler: self.requestHandler, configuration: self.configuration)
    }
}
