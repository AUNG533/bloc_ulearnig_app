# ulearning_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

// add
android/app/build.gradle
apply plugin: "com.google.gms.google-services"

dependencies {
implementation(platform("com.google.firebase:firebase-bom:32.2.2"))
implementation 'com.google.firebase:firebase-analytics-ktx'
}

android/build.gradle
buildscript {

    dependencies {
        
        classpath "com.google.gms:google-services:4.3.15"
    }
}