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
            url: "https://redth.github.io/netlift-sdk/swift/NetLift/0.1.0-alpha.7/NetLiftRuntime.xcframework.zip",
            checksum: "29cb970004b2b3ff47c8101c77440821c4104ec408e0239f2c6ed69b62c9799d"
        ),
        .binaryTarget(
            name: "NetLiftTools",
            url: "https://redth.github.io/netlift-sdk/swift/NetLift/0.1.0-alpha.7/netlift-swift-tools.artifactbundle.zip",
            checksum: "f28c5832aeb298a969796923599e8cdd568d210467e1a924415e20cbf87c76ce"
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
