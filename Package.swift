// swift-tools-version:5.9
import CompilerPluginSupport
import PackageDescription

let swiftFeatures: [SwiftSetting] = [
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("ConciseMagicFile"),
    .enableUpcomingFeature("ImportObjcForwardDeclarations"),
    .enableUpcomingFeature("ForwardTrailingClosures"),
    .enableUpcomingFeature("ImplicitOpenExistentials"),
]
let strictConcurrency = [SwiftSetting.enableExperimentalFeature("StrictConcurrency")]

let swiftLintPluginDependencies: [Target.Dependency] = [.target(name: "SwiftLintBinary")]

let package = Package(
    name: "SwiftLint",
    platforms: [.macOS(.v12)],
    products: [
        .plugin(name: "SwiftLintBuildToolPlugin", targets: ["SwiftLintBuildToolPlugin"])
    ],
    dependencies: [],
    targets: [
        .plugin(
            name: "SwiftLintBuildToolPlugin",
            capability: .buildTool(),
            dependencies: swiftLintPluginDependencies
        )
    ]
)

#if os(macOS)
package.targets.append(
    .binaryTarget(
        name: "SwiftLintBinary",
        url: "https://github.com/realm/SwiftLint/releases/download/0.57.1/SwiftLintBinary-macos.artifactbundle.zip",
        checksum: "c88bf3e5bc1326d8ca66bc3f9eae786f2094c5172cd70b26b5f07686bb883899"
    )
)
#endif
