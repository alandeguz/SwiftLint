// swift-tools-version:5.9
import CompilerPluginSupport
import PackageDescription

let swiftLintPluginDependencies: [Target.Dependency]

swiftLintPluginDependencies = [.target(name: "SwiftLintBinary")]

let package = Package(
    name: "SwiftLint",
    platforms: [.macOS(.v12)],
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
        url: "https://github.com/realm/SwiftLint/releases/download/0.59.1/SwiftLintBinary.artifactbundle.zip",
        checksum: "b9f915a58a818afcc66846740d272d5e73f37baf874e7809ff6f246ea98ad8a2"
    )
)
