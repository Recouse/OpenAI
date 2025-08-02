//
//  ResponseFormat.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 27/01/2024.
//

import JSONSchema

let a: ResponseFormat = .jsonSchema(
    name: "test",
    strict: false,
    schema: .object(
        properties: [
            "location": .string(
                description: "The city and state/country, e.g. 'San Francisco, CA'",
                examples: ["London, UK", "Tokyo, Japan"]
            ),
            "unit": .string(
                description: "The temperature unit to use",
                default: "celsius",
                enum: ["celsius", "fahrenheit"]
            ),
            "include_forecast": .boolean(
                description: "Whether to include the weather forecast",
                default: false
            )
        ],
        required: ["location"]
    )
)

public enum ResponseFormat: Encodable, Sendable {
    case jsonObject
    case jsonSchema(name: String, strict: Bool, schema: JSONSchema)

    var type: String {
        switch self {
        case .jsonObject: "json_object"
        case .jsonSchema: "json_schema"
        }
    }

    enum CodingKeys: CodingKey {
        case type
        case name
        case strict
        case schema
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.type, forKey: .type)

        switch self {
        case .jsonObject:
            break
        case let .jsonSchema(name, strict, schema):
            try container.encode(name, forKey: .name)
            try container.encode(strict, forKey: .strict)
            try container.encode(schema, forKey: .schema)
        }
    }
}
