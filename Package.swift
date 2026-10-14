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
            url: "https://redth.github.io/netlift-sdk/swift/NetLift/0.1.0-alpha.10/NetLiftRuntime.xcframework.zip",
            checksum: "418dee36cca920e5d236aaa6eeb4eb02782b5babf6d6ae851bd22730a7ee436b"
        ),
        .binaryTarget(
            name: "NetLiftTools",
            url: "https://redth.github.io/netlift-sdk/swift/NetLift/0.1.0-alpha.10/netlift-swift-tools.artifactbundle.zip",
            checksum: "397998dc50aeee6cc864e28ae1679e93f48d7fdbbadca800fd2edf33795c1ea6"
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
