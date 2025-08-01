// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "OpenAI",
    platforms: [
        .macOS("10.15"),
        .iOS("13.0"),
        .tvOS("13.0"),
        .watchOS("6.0"),
        .visionOS("1.0")
    ],
    products: [
        .library(
            name: "OpenAI",
            targets: ["OpenAI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Recouse/EventSource.git", from: "0.1.5")
    ],
    targets: [
        .target(
            name: "OpenAI",
            dependencies: [
                .product(name: "EventSource", package: "EventSource")
            ]
        ),
        .testTarget(
            name: "OpenAITests",
            dependencies: ["OpenAI"]
        )
    ]
)
