//
//  EditsModel.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 17/04/2023.
//

public extension Edits {
    enum Model: String, Decodable {
        case textDavinciEdit001 = "text-davinci-edit-001"
        case codeDavinciEdit001 = "code-davinci-edit-001"
    }
}
