# Advent of Code

Each challenge has its own executable and tests. Reusable code lives in the
`AOCShared` library, which challenges can access with `import AOCShared`.

```text
Package.swift
Shared/
    InputReader.swift
2025/
    C01/
        Sources/
            main.swift
            Dial.swift
            PuzzleInput.txt
        Tests/
            C01Tests.swift
```

## Requirements

Use Xcode 16 or newer with Swift 6, on macOS 15 or newer.
The package has no external dependencies.

## Run from the terminal

From this directory:

```sh
swift run 2025-C01
swift test --filter AOC2025C01Tests
```

Run every challenge's tests with `swift test`. Build all targets with
`swift build`, or just this challenge with `swift build --target AOC2025C01`.

Replace `2025/C01/Sources/PuzzleInput.txt` with your puzzle input before running.
Swift bundles that file with the executable, so input loading does not depend on
the working directory.

## Run in Xcode

1. Choose **File > Open** and open the root `Package.swift`.
2. Wait for Xcode to load the package, then select the `2025-C01` scheme and
   **My Mac** as the destination.
3. Press **Command-R** to run. The password appears in the debug console.
4. Press **Command-U** to test, or run individual tests in the Test navigator.

The package manifest is the source of truth for targets, dependencies, and resources.

## Add a challenge

For example, create `2025/C02/Sources` and `2025/C02/Tests`. Put `main.swift`,
the solution files, and `PuzzleInput.txt` in `Sources`, and Swift Testing files
in `Tests`. Add these entries to the corresponding arrays in `Package.swift`:

```swift
// products:
.executable(name: "2025-C02", targets: ["AOC2025C02"]),

// targets:
.executableTarget(
    name: "AOC2025C02",
    dependencies: ["AOCShared"],
    path: "2025/C02/Sources",
    resources: [.process("PuzzleInput.txt")]
),
.testTarget(
    name: "AOC2025C02Tests",
    dependencies: ["AOC2025C02"],
    path: "2025/C02/Tests"
),
```

Use `@testable import AOC2025C02` in its tests. Run it with
`swift run 2025-C02` and test it with `swift test --filter AOC2025C02Tests`.
Use the same naming pattern for other years so challenge names stay unique.
Move reusable helpers into `Shared/` and mark APIs used by challenges `public`.
