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
            url: "https://redth.github.io/netlift-sdk/swift/NetLift/0.1.0-alpha.4/NetLiftRuntime.xcframework.zip",
            checksum: "7e2fed1f2795129fd3b69a5150b9da860174e389eec8a454ec70a272a3fa3a21"
        ),
        .binaryTarget(
            name: "NetLiftTools",
            url: "https://redth.github.io/netlift-sdk/swift/NetLift/0.1.0-alpha.4/netlift-swift-tools.artifactbundle.zip",
            checksum: "ed0bce7c108e3dab271e39b017915af836d9c4954cb562710f164f1d3086ba8a"
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
