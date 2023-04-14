//
//  Usage.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 14/04/2023.
//

public struct Usage: Decodable {
    public let promptTokens: Int
    public let completionTokens: Int
    public let totalTokens: Int
}
