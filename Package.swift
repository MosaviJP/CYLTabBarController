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
            exclude: ["LottieSwift"],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("CYLBadge"),
                .headerSearchPath("CYLFlatDesignTabBar/CYLFlatDesignTabBar-ObjectiveC/CYLFlatDesignTabBar"),
                .headerSearchPath("CYLFlatDesignTabBar/CYLFlatDesignTabBar-ObjectiveC/CYLFlatDesignTabBarPrivate")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
