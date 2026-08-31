// swift-tools-version:5.9
import CompilerPluginSupport
import PackageDescription

let swiftLintPluginDependencies: [Target.Dependency]

swiftLintPluginDependencies = [.target(name: "SwiftLintBinary")]

let package = Package(
    name: "SwiftLint",
    platforms: [.macOS(.v13)],
    products: [
        .plugin(name: "SwiftLintBuildToolPlugin", targets: ["SwiftLintBuildToolPlugin"]),
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
        url: "https://github.com/realm/SwiftLint/releases/download/0.65.1/SwiftLintBinary.artifactbundle.zip",
        checksum: "c3a1d77647ca18c1b7e9be7dbc6cd4490d26422f28814b76370244ff61970869"
    )
)
