//
//  Configuration.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 15/04/2023.
//

extension OpenAI {
    struct Configuration {
        /// Open AI API key
        let apiKey: String?
        
        /// Organization ID
        ///
        /// For users who belong to multiple organizations, you can specify which organization
        /// is used for an API request. Usage from these API requests will count against
        /// the specified organization's subscription quota.
        let organization: String?
        
        var headers: HTTPHeaders {
            var headers: HTTPHeaders = [
                "Content-Type": "application/json"
            ]
            
            if let apiKey {
                headers["Authorization"] = "Bearer \(apiKey)"
            }
            
            if let organization {
                headers["OpenAI-Organization"] = organization
            }
            
            return headers
        }
    }
}
