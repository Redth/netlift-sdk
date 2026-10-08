# NetLift Maven preview repository

Add the repository and runtime dependency to an Android build:

```kotlin
repositories {
    maven { url = uri("https://redth.github.io/netlift-sdk/maven/") }
    google()
    mavenCentral()
}

dependencies {
    implementation("io.github.redth.netlift:runtime-android:0.1.0-alpha.1")
}
```

Published preview coordinates are immutable.
