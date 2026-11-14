# Flutter Base

Flutter project with the internal package name `zewail`.

## Stack declared in pubspec.yaml

- BLoC / flutter_bloc for state management
- Dio for networking
- get_it and injectable for dependency injection
- GoRouter for navigation
- Equatable and dartz
- ScreenUtil, SVG and Lottie UI dependencies

These are declared dependencies; their presence alone does not establish implementation coverage.

## Requirements

Use a Flutter SDK bundling Dart compatible with `^3.6.0`, plus platform tooling for your target device.

## Run locally

```sh
git clone https://github.com/noura1812/flutter_base.git
cd flutter_base
flutter pub get
dart run build_runner build
flutter run
```

The project declares generators for dependency injection, routing and API clients.

## Assets

Image, icon, Lottie, SVG and JSON asset directories, and the Cairo font family are declared in the package.

## Project status

Architecture walkthroughs, configuration requirements and screenshots need further documentation. This README does not claim a reusable framework, production readiness or passing tests. Build and test status have not been verified for this documentation update.
