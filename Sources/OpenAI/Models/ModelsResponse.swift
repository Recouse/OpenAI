//
//  ModelsResponse.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 15/04/2023.
//

public struct ModelsResponse: Decodable {
    public struct Model: Decodable, Identifiable {
        public let id: String
        public let object: String
        public let created: Int
        public let ownedBy: String
    }
    
    public var data: [Model]
}
