//
//  FinishReason.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 14/04/2023.
//

public enum FinishReason: String, Decodable {
    case stop
    case length
}
