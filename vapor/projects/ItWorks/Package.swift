import PackageDescription

let package = Package(
    name: "ItWorks",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", Version(1,5,15))
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

