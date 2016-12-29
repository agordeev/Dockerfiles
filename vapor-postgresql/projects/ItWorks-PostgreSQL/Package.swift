import PackageDescription

let package = Package(
    name: "ItWorks-PostgreSQL",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", Version(1,3,4)),
        .Package(url: "https://github.com/vapor/postgresql-provider.git", Version(1,1,1))
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

