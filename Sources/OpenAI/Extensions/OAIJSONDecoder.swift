//
//  OAIJSONDecoder.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 12/04/2023.
//

import Foundation

class OAIJSONDecoder: JSONDecoder {
    override init() {
        super.init()
        
        keyDecodingStrategy = .convertFromSnakeCase
        dateDecodingStrategy = .secondsSince1970
    }
}
