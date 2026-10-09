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
            url: "https://redth.github.io/netlift-sdk/swift/NetLift/0.1.0-alpha.5/NetLiftRuntime.xcframework.zip",
            checksum: "57ed9a55de4248f31c02d5ae3e5ef1c9c2452ef44a96b6700cda557913690dc7"
        ),
        .binaryTarget(
            name: "NetLiftTools",
            url: "https://redth.github.io/netlift-sdk/swift/NetLift/0.1.0-alpha.5/netlift-swift-tools.artifactbundle.zip",
            checksum: "baa1d7de92905dda9af1e55c469ff7635b690d5c233124db4f6611f4bfa8b2e8"
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
