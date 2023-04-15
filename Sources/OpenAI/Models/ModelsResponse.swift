//
//  ModelsResponse.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 15/04/2023.
//

public struct ModelsResponse: Decodable {
    public struct Model: Decodable, Identifiable {
        public var id: String
        public var object: String
        public var created: Int
        public var ownedBy: String

        public init(id: String, object: String, created: Int, ownedBy: String) {
            self.id = id
            self.object = object
            self.created = created
            self.ownedBy = ownedBy
        }
    }
    
    public var data: [Model]
}
