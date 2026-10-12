# NetLift Maven preview repository

The Maven repository is hosted at:

```text
https://redth.github.io/netlift-sdk/maven/
```

The current Android Gradle plugin is `io.github.redth.netlift` version
`0.1.0-alpha.11`. It selects runtime
`io.github.redth.netlift:runtime-android:0.1.0-alpha.3` by default. Preview
versions are immutable.

Add the repository to `settings.gradle.kts`:

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

Apply the plugin in the Android application module:

```kotlin
plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("io.github.redth.netlift") version "0.1.0-alpha.11"
}
```

Configure the managed project and contract roots with the `netlift` block.
The plugin generates Kotlin projections and packages an app-specific .NET
Android workload component during the Android build.

The preview currently targets `net11.0-android` and `android-arm64`. Build
requirements include JDK 17 or later, the .NET SDK pinned by the consuming
project with the `android` workload, Android SDK Platform 36, and NDK
`28.2.13676358`. The verified target is an API 36 ARM64 emulator; physical
devices have not been validated.

For the Swift package setup and overall preview support status, see the
[SDK README](../README.md).
