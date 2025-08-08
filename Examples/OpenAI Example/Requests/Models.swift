//
//  Models.swift
//  OpenAI Example
//
//  Created by Firdavs Khaydarov on 05/08/2025.
//

import Foundation
import OpenAI

enum APIType: String, CaseIterable, Identifiable {
    case chatCompletions = "chat_completions"
    case responses = "responses"
    
    var id: String { rawValue }
    
    var displayName: String {
        switch self {
        case .chatCompletions:
            return "Chat Completions"
        case .responses:
            return "Responses"
        }
    }
}

struct ChatMessage: Identifiable, Codable {
    let id: UUID
    var role: MessageRole
    var content: String
    let timestamp: Date
    
    init(role: MessageRole, content: String) {
        self.id = UUID()
        self.role = role
        self.content = content
        self.timestamp = Date()
    }
}

enum MessageRole: String, CaseIterable, Codable {
    case system
    case user
    case assistant
    
    var displayName: String {
        switch self {
        case .system:
            return "System"
        case .user:
            return "User"
        case .assistant:
            return "Assistant"
        }
    }
}

struct Request: Identifiable {
    let id = UUID()
    var name: String
    var apiType: APIType
    var systemPrompt: String
    var model: String
    var temperature: Double
    var messages: [ChatMessage]
    let createdAt: Date
    var updatedAt: Date
    
    init(name: String, apiType: APIType = .chatCompletions) {
        self.name = name
        self.apiType = apiType
        self.systemPrompt = ""
        self.model = "gpt-4o-mini"
        self.temperature = 1.0
        self.messages = []
        self.createdAt = Date()
        self.updatedAt = Date()
    }
    
    mutating func addMessage(_ message: ChatMessage) {
        messages.append(message)
        updatedAt = Date()
    }
    
    mutating func updateParameters(systemPrompt: String? = nil, model: String? = nil, temperature: Double? = nil, maxTokens: Int? = nil) {
        if let systemPrompt = systemPrompt {
            self.systemPrompt = systemPrompt
        }
        if let model = model {
            self.model = model
        }
        if let temperature = temperature {
            self.temperature = temperature
        }
        updatedAt = Date()
    }
}
