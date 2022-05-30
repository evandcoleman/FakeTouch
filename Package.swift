// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "FakeTouch",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "FakeTouch",
            targets: ["FakeTouch"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/mhdhejazi/Dynamic", from: "1.2.0"),
    ],
    targets: [
        .target(
            name: "FakeTouch",
            dependencies: ["Dynamic"]
        ),
    ]
)
