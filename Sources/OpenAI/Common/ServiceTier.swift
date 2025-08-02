//
//  ServiceTier.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 02/08/2025.
//

public enum ServiceTier: String, Codable, Sendable {
    case auto
    case `default`
    case flex
    case priority
}
