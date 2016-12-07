import PackageDescription

let package = Package(
    name: "ItWorks-MySQL",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", Version(1,2,3)),
        .Package(url: "https://github.com/vapor/mysql-provider.git", Version(1,1,0))
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

