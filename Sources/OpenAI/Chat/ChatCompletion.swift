//
//  ChatCompletion.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 12/04/2023.
//

import Foundation

public struct ChatCompletion {
    /// The role of the author of this message.
    public enum Role: String, Codable, CaseIterable {
        case system
        case user
        case assistant
    }
}
