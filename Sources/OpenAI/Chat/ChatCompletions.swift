//
//  ChatCompletions.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 14/04/2023.
//

public struct ChatCompletions {
    /// The role of the author of this message.
    public enum Role: String, Codable, CaseIterable {
        case system
        case user
        case assistant
    }
}
