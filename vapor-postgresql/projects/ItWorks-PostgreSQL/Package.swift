import PackageDescription

let package = Package(
    name: "ItWorks-PostgreSQL",
    targets: [
        Target(name: "App"),
        Target(name: "Run", dependencies: ["App"]),
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", "2.3.0"),
        .Package(url: "https://github.com/vapor/fluent-provider.git", "1.3.0"),
        .Package(url: "https://github.com/vapor/postgresql-provider.git", "2.1.0")
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)

