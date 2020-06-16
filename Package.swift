// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CanvasKit",
    products: [
        .library(
            name: "CanvasKit",
            targets: ["CanvasKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "CanvasKit",
            dependencies: [
                .product(name:"AsyncHTTPClient", package: "async-http-client")
            ]),
        .testTarget(
            name: "CanvasKitTests",
            dependencies: ["CanvasKit"]),
    ]
)
