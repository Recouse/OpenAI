//
//  OAIJSONEncoder.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 12/04/2023.
//

import Foundation

class OAIJSONEncoder: JSONEncoder {
    override init() {
        super.init()
        
        keyEncodingStrategy = .convertToSnakeCase
    }
}
