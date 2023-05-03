//
//  OpenAIError.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 13/04/2023.
//

public enum OpenAIError: Error {
    case invalidHTTPResponse
    case streamError(description: String)
    case streamClosed
    case incompatibleModel
    case undefinedError(httpStatusCode: Int)
    case apiError(APIError)
}
