//
//  Request.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 14/04/2023.
//

import Foundation

public protocol Request {
    var method: HTTPMethod { get }
    var host: String { get }
    var version: String { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
    var body: Data? { get }
}

public extension Request {
    static var encoder: JSONEncoder {
        .openAIEncoder
    }
    
    var headers: HTTPHeaders? {
        nil
    }
}

public struct HTTPMethod: RawRepresentable, ExpressibleByStringLiteral {
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

public typealias HTTPHeaders = [String: String]
