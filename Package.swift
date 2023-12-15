// swift-tools-version:5.9
import CompilerPluginSupport
import PackageDescription

let swiftFeatures: [SwiftSetting] = [
    .enableUpcomingFeature("ExistentialAny")
]

let package = Package(
    name: "SwiftLint",
    platforms: [.macOS(.v12)],
    products: [
        .plugin(name: "SwiftLintPlugin", targets: ["SwiftLintPlugin"])
    ],
    dependencies: [ ],
    targets: [
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool(),
            dependencies: [
                .target(name: "SwiftLintBinary", condition: .when(platforms: [.macOS])),
            ]
        ),
        .binaryTarget(
            name: "SwiftLintBinary",
            url: "https://github.com/realm/SwiftLint/releases/download/0.54.0/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "963121d6babf2bf5fd66a21ac9297e86d855cbc9d28322790646b88dceca00f1"
        )
    ]
)
