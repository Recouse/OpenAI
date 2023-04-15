//
//  JSONDecoder.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 12/04/2023.
//

import Foundation

extension JSONDecoder {
    static var openAIDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }
}
