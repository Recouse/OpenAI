# OpenAI

With this package, you can quickly and easily access a variety of OpenAI API endpoints, including text generation, language translation, and question answering. The package provides a convenient and intuitive interface that abstracts away the complexity of API calls, allowing you to focus on building intelligent and sophisticated applications.

## What's Implemented:
- [ ] [Models](https://platform.openai.com/docs/api-reference/models)
- [x] [Completions](https://platform.openai.com/docs/api-reference/completions)
- [x] [Chat](https://platform.openai.com/docs/api-reference/chat)
- [ ] [Edits](https://platform.openai.com/docs/api-reference/edits)
- [ ] [Images](https://platform.openai.com/docs/api-reference/images)
- [ ] [Embeddings](https://platform.openai.com/docs/api-reference/embeddings)
- [ ] [Audio](https://platform.openai.com/docs/api-reference/audio)
- [ ] [Files](https://platform.openai.com/docs/api-reference/files)
- [ ] [Fine-tunes](https://platform.openai.com/docs/api-reference/fine-tunes)
- [ ] [Moderations](https://platform.openai.com/docs/api-reference/moderations)

## Installation

The module name of the package is `OpenAI`. Choose one of the instructions below to install and add 
the following import statement to your source code.

```swift
import OpenAI
```

#### [Xcode Package Dependency](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

From Xcode menu: `File` > `Swift Packages` > `Add Package Dependency`

```text
https://github.com/Recouse/OpenAI
```

#### [Swift Package Manager](https://www.swift.org/package-manager)

In your `Package.swift` file, first add the following to the package `dependencies`:

```swift
.package(url: "https://github.com/Recouse/OpenAI.git"),
```

And then, include "OpenAI" as a dependency for your target:

```swift
.target(name: "<target>", dependencies: [
    .product(name: "OpenAI", package: "OpenAI"),
]),
```

## Compatibility

* macOS 10.15+
* iOS 13.0+
* tvOS 13.0+
* watchOS 6.0+

## Dependencies

* EventSource https://github.com/Recouse/EventSource

## Contributing

Contributions to are always welcomed! If you'd like to contribute, please fork this repository and 
submit a pull request with your changes.

## License

OpenAI is released under the MIT license. See [LICENSE](LICENSE) for more information.
