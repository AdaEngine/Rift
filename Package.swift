// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Rift",
    platforms: [
        .macOS(.v12),
        .iOS(.v16),
        .tvOS(.v16),
        .visionOS(.v1)
    ],
    dependencies: [
        .package(name: "gravity-lang", path: "Modules/gravity-lang"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0")
    ],
    targets: [
        .executableTarget(
            name: "Rift",
            dependencies: [
                .product(name: "Gravity", package: "gravity-lang")
            ]
        ),
    ]
)
