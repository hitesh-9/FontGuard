// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "FontGuard",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "FontGuard",
            targets: ["FontGuard"]
        )
    ],
    targets: [
        .target(
            name: "FontGuard",
            path: "Sources/FontGuard"
        )
    ]
)
