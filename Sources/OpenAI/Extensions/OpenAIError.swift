//
//  OpenAIError.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 13/04/2023.
//

enum OpenAIError: Error {
    case streamError(description: String)
    case streamClosed
}
