//
//  JSONEncoder.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 12/04/2023.
//

import Foundation

extension JSONEncoder {
    static var openAIEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
}
