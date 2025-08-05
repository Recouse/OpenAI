// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "OpenAI",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "OpenAI",
            targets: ["OpenAI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Recouse/EventSource.git", from: "0.1.5"),
        .package(url: "https://github.com/mattt/JSONSchema.git", from: "1.3.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.4")
    ],
    targets: [
        .target(
            name: "OpenAI",
            dependencies: [
                .product(name: "EventSource", package: "EventSource"),
                .product(name: "JSONSchema", package: "JSONSchema"),
                .product(name: "Logging", package: "swift-log")
            ]
        ),
        .testTarget(
            name: "OpenAITests",
            dependencies: ["OpenAI"]
        )
    ]
)
