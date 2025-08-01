//
//  APIError.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 03/05/2023.
//

import Foundation

public struct APIError: Decodable, Sendable {
    let message: String
    let type: APIErrorType
    let param: String?
    let code: String?
    
    enum RootKeys: String, CodingKey {
        case error
    }

    enum ErrorKeys: String, CodingKey {
        case message, type, param, code
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        
        let errorContainer = try container.nestedContainer(keyedBy: ErrorKeys.self, forKey: .error)
        self.message = try errorContainer.decode(String.self, forKey: .message)
        self.type = (try? errorContainer.decode(APIErrorType.self, forKey: .type)) ?? .undefined
        self.param = try errorContainer.decodeIfPresent(String.self, forKey: .param)
        self.code = try errorContainer.decodeIfPresent(String.self, forKey: .code)
    }
}

public enum APIErrorType: String, Decodable, Sendable {
    /// The request made is invalid, incomplete, or contains incorrect parameters.
    case invalidRequestError = "invalid_request_error"
    
    /// The API key provided is invalid or not authorized to access the requested resource.
    case unauthorizedError = "unauthorized_error"
    
    /// The rate limit for the API has been exceeded by the user.
    case rateLimitExceededError = "rate_limit_exceeded_error"
    
    /// The model specified in the request is not found or does not exist.
    case modelNotFoundError = "model_not_found_error"
    
    /// The request was interrupted by the user.
    case interruptedError = "interruptedError"
    
    /// The server encountered an internal error while processing the request.
    case serverError = "server_error"
    
    case undefined
}
