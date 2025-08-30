// swift-tools-version:5.9
import CompilerPluginSupport
import PackageDescription

let swiftLintPluginDependencies: [Target.Dependency]

swiftLintPluginDependencies = [.target(name: "SwiftLintBinary")]

let package = Package(
    name: "SwiftLint",
    platforms: [.macOS(.v13)],
    products: [
        .plugin(name: "SwiftLintBuildToolPlugin", targets: ["SwiftLintBuildToolPlugin"])
    ],
    dependencies: [ ],
    targets: [
        .plugin(
            name: "SwiftLintBuildToolPlugin",
            capability: .buildTool(),
            dependencies: swiftLintPluginDependencies,
            packageAccess: false
        ),
    ]
)

package.targets.append(
    .binaryTarget(
        name: "SwiftLintBinary",
        url: "https://github.com/realm/SwiftLint/releases/download/0.60.0/SwiftLintBinary.artifactbundle.zip",
        checksum: "90cc717aa527a5b1ce87c99bb9586a3a4dd6aa90bfe4ca8ecb7748e60c4e234e"
    )
)
