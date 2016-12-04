import PackageDescription

let package = Package(
    name: "ItWorks-PostgreSQL",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", Version(1,2,0)),
        .Package(url: "https://github.com/vapor/postgresql-provider.git", Version(1,0,0))
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

