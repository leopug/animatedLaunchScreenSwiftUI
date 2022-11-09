// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "FeatureKit",
            targets: ["LaunchScreenKit", "MainAppKit"]), // add a new target here
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LaunchScreenKit",
            dependencies: []),
        .testTarget(
            name: "LaunchScreenKitTests",
            dependencies: ["LaunchScreenKit"]),
        
        .target( // add a new target here
            name: "MainAppKit",
            dependencies: ["LaunchScreenKit"]),
        .testTarget( // add a new target test here
            name: "MainAppKitTests",
            dependencies: ["MainAppKit"])
    ]
)
