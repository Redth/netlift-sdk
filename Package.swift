// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "NetLiftRuntime",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "NetLiftRuntime", targets: ["NetLiftRuntime"]),
    ],
    targets: [
        .binaryTarget(
            name: "NetLiftC",
            url: "https://redth.github.io/netlift-sdk/swift/NetLiftRuntime/0.1.0-alpha.1/NetLiftRuntime.xcframework.zip",
            checksum: "e335d3da851d1c132221f08caa9f974c2100f4bb08ca25c2c875a507d2da7689"
        ),
        .target(
            name: "NetLiftRuntime",
            dependencies: ["NetLiftC"]
        ),
    ]
)
