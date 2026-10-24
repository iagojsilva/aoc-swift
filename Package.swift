// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AOC",
    platforms: [
        .macOS(.v15),
    ],
    products: [
        .library(name: "AOCShared", targets: ["AOCShared"]),
        .executable(name: "2025-C01", targets: ["AOC2025C01"]),
        .executable(name: "2025-C02", targets: ["AOC2025C02"]),
    ],
    targets: [
        .target(
            name: "AOCShared",
            path: "Shared"
        ),
        .executableTarget(
            name: "AOC2025C01",
            dependencies: ["AOCShared"],
            path: "2025/C01/Sources",
            resources: [
                .process("PuzzleInput.txt"),
            ]
        ),
        .testTarget(
            name: "AOC2025C01Tests",
            dependencies: ["AOC2025C01"],
            path: "2025/C01/Tests"
        ),
        .executableTarget(
            name: "AOC2025C02",
            dependencies: ["AOCShared"],
            path: "2025/C02/Sources",
            resources: [
                .process("PuzzleInput.txt"),
            ]
        ),
        .testTarget(
            name: "AOC2025C02Tests",
            dependencies: ["AOC2025C02"],
            path: "2025/C02/Tests"
        ),
    ]
)
