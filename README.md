# NetLift SDK previews

Preview packages for [NetLift](https://github.com/Redth/netlift), which
generates platform clients and native-service bindings from ordinary .NET
service contracts.

## Current packages

| Target | Package | Version | Distribution |
| --- | --- | --- | --- |
| Android | Gradle plugin `io.github.redth.netlift` | `0.1.0-alpha.11` | [Maven preview repository](https://redth.github.io/netlift-sdk/maven/) |
| Android | Runtime `io.github.redth.netlift:runtime-android` (selected by the plugin) | `0.1.0-alpha.3` | [Maven preview repository](https://redth.github.io/netlift-sdk/maven/) |
| Apple | Swift package `NetLift` (runtime XCFramework and build-tool plugin) | `0.1.0-alpha.7` | [Swift Package](https://github.com/Redth/netlift-sdk.git) |

Preview versions are immutable. Pin the exact version you have tested.

## Android

Add the preview repository to `settings.gradle.kts`:

```kotlin
pluginManagement {
    repositories {
        maven { url = uri("https://redth.github.io/netlift-sdk/maven/") }
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        maven { url = uri("https://redth.github.io/netlift-sdk/maven/") }
        google()
        mavenCentral()
    }
}
```

Apply the plugin in the Android app module and point it at the managed contract
project:

```kotlin
plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("io.github.redth.netlift") version "0.1.0-alpha.11"
}

netlift {
    managedProject.set(rootProject.file("../Contracts/Contracts.csproj"))
    contractRoots.set(listOf("Example.Contracts.IHelloService"))
    kotlinPackage.set("com.example.generated")
}
```

The plugin generates Kotlin DTOs and coroutine clients and builds the
app-specific .NET Android component. It adds runtime
`io.github.redth.netlift:runtime-android:0.1.0-alpha.3` automatically. The
default component target is `net11.0-android` with the `android-arm64` runtime
identifier.

Android setup requires JDK 17 or later, the .NET SDK pinned by the consuming
project, the .NET `android` workload, Android SDK Platform 36, and NDK
`28.2.13676358`. The preview has been verified on an API 36 ARM64 emulator.

## Swift

Add the package at its current exact preview version:

```swift
.package(
    url: "https://github.com/Redth/netlift-sdk.git",
    exact: "0.1.0-alpha.7"
)
```

Attach `NetLiftPlugin` to the Swift target that owns a `netlift.json` file:

```swift
.executableTarget(
    name: "MyApp",
    exclude: ["netlift.json"],
    plugins: [
        .plugin(name: "NetLiftPlugin", package: "netlift-sdk"),
    ]
)
```

Example `Sources/MyApp/netlift.json`:

```json
{
  "version": 1,
  "managedProject": "../../Managed/Contracts/Contracts.csproj",
  "contractRoots": ["Example.Contracts.IHelloService"],
  "swiftModule": "MyApp"
}
```

The managed project must be inside the consuming Swift package. The plugin
generates Swift DTOs, `async throws` clients, native-owned service protocols
and typed registration helpers. Stream clients are pull-driven
`AsyncSequence`s: opening a sequence does not start the stream, each `next()`
reads one item, and termination or cancellation revokes the stream.

The package declares macOS 13 and iOS 15 minimum platforms. The published
runtime currently contains the contract-neutral V1 C ABI for Apple Silicon
iOS Simulator; physical-device support has not been verified. App-specific
managed assemblies, registrar output, and CoreCLR/R2R assets are generated
inside the consuming app build and are not part of the runtime XCFramework.

## Preview status

The currently verified targets are an API 36 ARM64 Android emulator and an
Apple Silicon iOS simulator. Physical Android and Apple devices have not been
validated, and stable promotion is not complete. These artifacts are previews,
not a production-support commitment.

For a complete Android setup-to-Hello-World walkthrough, see
`product/samples/HelloWorld.Android/README.md` in the
[NetLift source repository](https://github.com/Redth/netlift).
