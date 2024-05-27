# spa_sdk

SPA SDK for Flutter

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS. 

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Android
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>


## iOS
    // This is probably the only one you need. Background location is supported
    // by this -- the caveat is that a blue badge is shown in the status bar
    // when the app is using location service while in the background.
    NSLocationWhenInUseUsageDescription
    
    // Deprecated, use NSLocationAlwaysAndWhenInUseUsageDescription instead.
    NSLocationAlwaysUsageDescription
    
    // Use this very carefully. This key is required only if your iOS app
    // uses APIs that access the user’s location information at all times,
    // even if the app isn't running.
    NSLocationAlwaysAndWhenInUseUsageDescription

# spa_sdk
