import PackageDescription

let package = Package(
    name: "ItWorks-Sqlite",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", Version(1,3,0)),
        .Package(url: "https://github.com/vapor/sqlite-provider.git", Version(1,1,0))
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
        "Tests",
    ]
)

