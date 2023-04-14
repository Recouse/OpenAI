//
//  HTTPMethod.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 13/04/2023.
//

struct HTTPMethod: RawRepresentable, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public init(stringLiteral value: StringLiteralType) {
        rawValue = value
    }
    
    public static let get: Self = "GET"
    public static let post: Self = "POST"
}
