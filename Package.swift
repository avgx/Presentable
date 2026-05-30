// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "Presentable",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .tvOS(.v18),
        .macOS(.v13),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "Presentable",
            targets: ["Presentable"]
        ),
    ],
    targets: [
        .target(
            name: "Presentable"
        ),
        .testTarget(
            name: "PresentableTests",
            dependencies: ["Presentable"]
        ),
    ]
)
