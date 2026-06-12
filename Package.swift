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
        url: "https://github.com/realm/SwiftLint/releases/download/0.63.3/SwiftLintBinary.artifactbundle.zip",
        checksum: "a0a59ee28019171fb43a4278ae2f7eac610e194b4d98abf47fd6092c7aff65aa"
    )
)
