# NetLift Maven preview repository

Add the repository to `pluginManagement` and apply the plugin:

```kotlin
// settings.gradle.kts
pluginManagement {
    repositories {
        maven { url = uri("https://redth.github.io/netlift-sdk/maven/") }
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

// app/build.gradle.kts
plugins {
    id("io.github.redth.netlift") version "0.1.0-alpha.1"
}
```

The plugin adds `io.github.redth.netlift:runtime-android:0.1.0-alpha.1`
automatically. Direct runtime consumption remains available for lower-level
integration tests.

Published preview coordinates are immutable.
