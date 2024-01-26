//
//  ResponseFormat.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 27/01/2024.
//

public struct ResponseFormat: Encodable {
    public enum `Type`: String, Encodable {
        case jsonObject = "json_object"
    }
    
    public let type: `Type`
}
