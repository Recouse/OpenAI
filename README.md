# OpenAI

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FRecouse%2FOpenAI%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Recouse/OpenAI) [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FRecouse%2FOpenAI%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Recouse/OpenAI)

A modern, type-safe Swift package for seamless integration with OpenAI's API across all Apple platforms. Built with async/await support and streaming capabilities.

## Features

- **🛡️ Type Safety**: Comprehensive Swift types for all API endpoints
- **⚡ Modern Swift**: Built with async/await, Codable, and Swift concurrency
- **🔄 Streaming Support**: Chat completions with async sequences
- **🌐 Cross-Platform**: Works on Apple platforms (iOS, macOS, tvOS, watchOS, visionOS), Linux and Android
- **🎯 Comprehensive API Coverage**: Support for all major OpenAI endpoints

## Compatibility

* macOS 10.15+
* iOS 13.0+
* tvOS 13.0+
* watchOS 6.0+
* visionOS 1.0+

## Installation

#### [Xcode Package Dependency](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)

From Xcode menu: `File` > `Swift Packages` > `Add Package Dependency`

```text
https://github.com/Recouse/OpenAI
```

#### [Swift Package Manager](https://www.swift.org/package-manager)

In your `Package.swift` file, first add the following to the package `dependencies`:

```swift
.package(url: "https://github.com/Recouse/OpenAI.git", from: "0.1.0"),
```

And then, include "OpenAI" as a dependency for your target:

```swift
.target(
    name: "<target>",
    dependencies: [
        .product(name: "OpenAI", package: "OpenAI"),
    ]
),
```

## Basic Usage

```swift
import OpenAI

// Initialize client
let client = OpenAI(apiKey: "your-api-key-here")

// Simple chat completion
let response = try await client.chat.completions(
    model: .gpt4_1_mini,
    messages: [.user("Explain quantum computing in simple terms")]
)

print(response.choices.first?.message.content ?? "No response")
```

### Streaming Responses

#### Chat Completions

```swift
// Stream chat completions
let stream = client.chat.completionsStream(
    model: .gpt4_1_nano,
    messages: [.user("Write a short story about space exploration")]
)

for try await chunk in stream {
    print(chunk.choices.first?.delta.content ?? "")
}
```

#### Responses

```swift
// Stream responses
let responses = openAI.responses.createStream(
    input: .text("Explain teleportation in simple terms"),
    model: .gpt4_1_nano
)

for try await response in responses {
    // Filter text deltas
    guard response.type == .outputTextDelta else { continue }
    print(response.delta ?? "")
}
```

## Examples

Check out the [Examples](/Examples) directory for a complete sample application demonstrating how to use this package in an app.

## What's Implemented:

- [x] [Models](https://platform.openai.com/docs/api-reference/models)
- [x] [Completions (Deprecated)](https://platform.openai.com/docs/api-reference/completions)
- [x] [Chat Completions](https://platform.openai.com/docs/api-reference/chat)
- [x] [Responses](https://platform.openai.com/docs/api-reference/responses)
- [ ] [Images](https://platform.openai.com/docs/api-reference/images)
- [ ] [Embeddings](https://platform.openai.com/docs/api-reference/embeddings)
- [ ] [Audio](https://platform.openai.com/docs/api-reference/audio)
- [ ] [Files](https://platform.openai.com/docs/api-reference/files)
- [ ] [Fine-tunes](https://platform.openai.com/docs/api-reference/fine-tunes)
- [ ] [Moderations](https://platform.openai.com/docs/api-reference/moderations)

## Dependencies

* EventSource https://github.com/Recouse/EventSource
* JSONSchema https://github.com/mattt/JSONSchema
* swift-log https://github.com/apple/swift-log

## Contributing

Contributions to are always welcomed! If you'd like to contribute, please fork this repository and 
submit a pull request with your changes.

## License

OpenAI is released under the MIT license. See [LICENSE](LICENSE) for more information.
