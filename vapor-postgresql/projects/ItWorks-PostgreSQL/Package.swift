// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "ItWorks-PostgreSQL",
    products: [
        .library(name: "App", targets: ["App"]),
        .executable(name: "Run", targets: ["Run"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "2.3.0"),
        .package(url: "https://github.com/vapor/fluent-provider.git", from: "1.3.0"),
        .package(url: "https://github.com/vapor/postgresql-provider.git", from: "2.1.0"),
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "FluentProvider", "PostgreSQLProvider"],
                exclude: [
                    "Config",
                    "Public",
                    "Resources",
                ]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App", "Testing"])
    ]
)
