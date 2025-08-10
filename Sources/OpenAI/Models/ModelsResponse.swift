//
//  ModelsResponse.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 15/04/2023.
//

public struct ModelsResponse: Decodable, Sendable {
    public struct Model: Decodable, Identifiable, Sendable {
        public let id: String
        public let object: String
        public let created: Int
        public let ownedBy: String
    }
    
    public var data: [Model]
}
