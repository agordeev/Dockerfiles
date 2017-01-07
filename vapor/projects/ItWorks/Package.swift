import PackageDescription

let package = Package(
    name: "ItWorks",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", Version(1,3,8))
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

