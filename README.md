# NetLift SDK preview artifacts

Public preview packages for [NetLift](https://github.com/Redth/netlift).

The Maven repository is available at:

```text
https://redth.github.io/netlift-sdk/maven/
```

It contains the Android runtime and the `io.github.redth.netlift` Gradle
plugin, including the standard Maven plugin marker used by the Gradle
`plugins` block.

Preview versions are immutable. Published artifacts are retained so existing
consumer builds remain reproducible.

The Swift package preview is available at:

```swift
.package(
    url: "https://github.com/Redth/netlift-sdk.git",
    exact: "0.1.0-alpha.4"
)
```

`NetLiftRuntime` currently contains only the contract-neutral V1 C ABI for
Apple Silicon iOS Simulator 15.0 or later. It does not claim physical-device
support. App-specific managed assemblies, registrar output, and CoreCLR/R2R
assets are generated inside the consuming app build and are never published
in the runtime XCFramework.

Attach `NetLiftPlugin` to a Swift target with a target-owned `netlift.json`.
The plugin invokes the bundled, self-contained `netlift-swift` compiler and
adds the generated Swift DTOs and `async throws` service clients to the target.
The managed project must be inside the consuming Swift package.
