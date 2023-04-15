//
//  File.swift
//  
//
//  Created by Firdavs Khaydarov on 14/04/2023.
//

public protocol RequestHandler {    
    func perform<T>(for model: T.Type, with request: Request) async throws -> T where T: Decodable
    
    func stream<T>(for model: T.Type, with request: Request) -> AsyncThrowingStream<T, Error> where T: Decodable
}
