//
//  ResponseError.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 04/08/2025.
//

public struct ResponseError: Codable, Sendable {
    public let code: String
    public let message: String
}
