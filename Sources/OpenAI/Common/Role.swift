//
//  Role.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 04/08/2025.
//

/// The role of the author of the message.
public enum Role: String, Codable, Sendable, CaseIterable {
    case system
    case user
    case assistant
    case developer
}
