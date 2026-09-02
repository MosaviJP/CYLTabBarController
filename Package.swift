// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CYLTabBarController",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "CYLTabBarController",
            targets: ["CYLTabBarController"]
        )
    ],
    targets: [
        .target(
            name: "CYLTabBarController",
            path: "CYLTabBarController",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath(".")
            ]
        )
    ]
)
