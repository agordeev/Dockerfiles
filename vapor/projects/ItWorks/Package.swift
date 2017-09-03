import PackageDescription

let package = Package(
    name: "ItWorks",
    targets: [
        Target(name: "App"),
        Target(name: "Run", dependencies: ["App"]),
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", "2.2.2"),
        .Package(url: "https://github.com/vapor/leaf-provider.git", "1.1.0"),
    ],
    exclude: [
        "Config",
        "Database",
        "Public",
        "Resources",
    ]
)

