//
//  RequestsModel.swift
//  OpenAI Example
//
//  Created by Firdavs Khaydarov on 03/08/2025.
//

import Observation
import Foundation

@Observable
final class RequestsModel {
    private(set) var requests: [Request] = [
        Request(name: "General Assistant", apiType: .chatCompletions),
        Request(name: "Creative Writing", apiType: .responses)
    ]

    var selection: Request.ID?

    init() {
        
    }

    func createRequest(name: String, apiType: APIType = .chatCompletions) -> Request {
        let request = Request(name: name, apiType: apiType)
        requests.append(request)
        return request
    }

    func deleteRequest(_ request: Request) {
        requests.removeAll { $0.id == request.id }
    }

    func updateRequest(_ request: Request) {
        if let index = requests.firstIndex(where: { $0.id == request.id }) {
            requests[index] = request
        }
    }
}
