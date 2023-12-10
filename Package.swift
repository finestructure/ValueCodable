// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "ValueCodable",
    products: [
        .library(
            name: "ValueCodable",
            targets: ["ValueCodable"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "ValueCodable",
            dependencies: []),
        .testTarget(
            name: "ValueCodableTests",
            dependencies: ["ValueCodable", "Yams"]),
    ]
)
