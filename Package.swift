// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "NetLift",
    platforms: [
        .macOS(.v13),
        .iOS(.v15),
    ],
    products: [
        .library(name: "NetLiftRuntime", targets: ["NetLiftRuntime"]),
        .plugin(name: "NetLiftPlugin", targets: ["NetLiftPlugin"]),
    ],
    targets: [
        .binaryTarget(
            name: "NetLiftC",
            url: "https://redth.github.io/netlift-sdk/swift/NetLift/0.1.0-alpha.6/NetLiftRuntime.xcframework.zip",
            checksum: "c1accb0796a9fb508bcbf4e74f61b1c53148d86ddc9f5d34445e434793efd7a6"
        ),
        .binaryTarget(
            name: "NetLiftTools",
            url: "https://redth.github.io/netlift-sdk/swift/NetLift/0.1.0-alpha.6/netlift-swift-tools.artifactbundle.zip",
            checksum: "03ff298393b556d3d7844a2f099598e3d463998469eb6f5bf8d0f462764770b5"
        ),
        .target(
            name: "NetLiftRuntime",
            dependencies: ["NetLiftC"]
        ),
        .plugin(
            name: "NetLiftPlugin",
            capability: .buildTool(),
            dependencies: ["NetLiftTools"]
        ),
    ]
)
