# Project Title

Flutter Redux Presentation

## About this Project

- 社内向けの勉強会資料
- 状態管理手法 Redux の内部構造について考える

## Getting Started

### Dependencies

使用ツールの version など開示
今回のプロジェクトでは、Null Safety Version の Flutter2系対応していないコードとなります。

```zsh
[✓] Flutter (Channel unknown, 1.22.3, on Mac OS X 10.15.7 19H1217, locale en-JP)
    • Flutter version 1.22.3 at /Users/kotarokamashima/fvm/versions/1.22.3
    • Framework revision 8874f21e79 (8 months ago), 2020-10-29 14:14:35 -0700
    • Engine revision a1440ca392
    • Dart version 2.10.3

[✓] Android toolchain - develop for Android devices (Android SDK version 30.0.2)
    • Android SDK at /Users/kotarokamashima/Library/Android/sdk
    • Platform android-30, build-tools 30.0.2
    • Java binary at: /Applications/Android Studio.app/Contents/jre/jdk/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b3-6915495)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 12.4)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Xcode 12.4, Build version 12D4e
    • CocoaPods version 1.10.0

[✓] Android Studio (version 4.1)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin installed
    • Dart plugin version 201.9245
    • Java version OpenJDK Runtime Environment (build 1.8.0_242-release-1644-b3-6915495)

[✓] VS Code (version 1.57.1)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.24.0

[✓] Connected device (1 available)
    • sdk gphone x86 (mobile) • emulator-5554 • android-x86 • Android 11 (API 30) (emulator)
```

### Requirements

- [Flutter install for Mac](https://flutter.dev/docs/get-started/install/macos)
- [fvm - Flutter SDK version management tool](https://zenn.dev/welchi/articles/d8f120adeebc7a85ed17)

バージョン管理ツール fvm を使うと便利です。

IDEは Visual Studio Code, Android Studioなど個人の好みを使ってください。

### Installing

```zsh
git clone https://github.com/Kotaro666-dev/flutter_redux_presentation.git
```

### Executing program

IDE を通じて Flutter Run する

or

iOS Simulator/Android Emulatorが起動している、または実機端末と接続している状態で

```zsh
flutter run
```

# Main issue

## Focus point

store.dispatch(Action)メソッドを実行した時にどのような内部フロー(MiddleWare含めて)を通じて Reducer がコールされるのか。

## Redux: A sequence of flow

store.dispatch(Action) -> several MiddleWares -> Reducer -> Store -> View

1. 何かしらがトリガーとなって、Action が呼び出される
2. MiddleWares がコールされる
3. Reducer がコールされて、作られた新しい State が Store に格納される
4. 更新された Store を基に View を再構築する

## What is MiddleWare used for?

> Redux middleware solves different problems than Express or Koa middleware, but in a conceptually similar way. Redux middleware provides a third-party extension point between dispatching an action, and the moment it reaches the reducer. People use Redux middleware for logging, crash reporting, talking to an asynchronous API, routing, and more.

- [Redux Fundamentals, Part 4: Store/MiddleWare](https://redux.js.org/tutorials/fundamentals/part-4-store#middleware)

## What store.dispatch() does?

```dart
/// Runs the action through all provided [Middleware], then applies an action
/// to the state using the given [Reducer]. Please note: [Middleware] can
/// intercept actions, and can modify actions or stop them from passing
/// through to the reducer.
void dispatch(dynamic action) {
_dispatchers[0](action);
}
```

## Furthermore

勉強会の時の別資料で話します