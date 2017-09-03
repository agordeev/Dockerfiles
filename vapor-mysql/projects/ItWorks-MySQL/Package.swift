import PackageDescription

let package = Package(
    name: "ItWorks-MySQL",
    targets: [
        Target(name: "App"),
        Target(name: "Run", dependencies: ["App"]),
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", "2.2.2"),
        .Package(url: "https://github.com/vapor/fluent-provider.git", "1.1.1"),
        .Package(url: "https://github.com/vapor/mysql-provider.git", "2.0.0")
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)

