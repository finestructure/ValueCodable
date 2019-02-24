// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ValueCodable",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "ValueCodable",
            targets: ["ValueCodable"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "ValueCodable",
            dependencies: []),
        .testTarget(
            name: "ValueCodableTests",
            dependencies: ["ValueCodable", "Yams"]),
    ]
)
