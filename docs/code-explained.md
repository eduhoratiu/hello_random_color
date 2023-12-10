# Flutter Code Explained

This document serves as a comprehensive guide to understanding the Flutter source code of the Hello Random Color app. It's designed to walk beginners through each section of the app's codebase, explaining the functionalities and Flutter concepts used. Starting with the `main.dart` file, the document breaks down complex Flutter elements into digestible explanations, making it a valuable resource for those new to Flutter or mobile app development. This document aims to provide insights into practical Flutter application development, enhancing the learning experience for beginners.

## main.dart

In the [main.dart](../lib/main.dart) file, each line and Flutter component plays a crucial role in setting up the application. This file is fundamental for understanding how to set up and launch a Flutter application, introducing key concepts like widgets, theming, and app structure.

Let's take a look at the parts of the `main.dart` file and see what they do.

### Imports

#### The Material package

The Material package is a collection of Flutter widgets, classes, and tools that are useful for building applications with a Material Design look and feel.

```dart
import 'package:flutter/material.dart';
```

This line imports the Material package, which is required for building the app's UI.

#### Local Imports

The `main.dart` file imports the following files from the `lib` directory:

```dart
import 'common/strings.dart' as strings;
import 'screens/home_screen.dart';
```

The `strings.dart` file contains string constants used throughout the app. The `as` keyword is used to create a prefix for the imported file, allowing you to refer to the file's contents using the prefix. As you will see below, the app's title is defined in the `strings.dart` file, that's why it's imported here.

The `home_screen.dart` file contains the app's main screen. We have to import it here because we use it in the `home` property of the `MaterialApp` widget below.

Read more about:

- [Libraries & imports](https://dart.dev/language/libraries)
- [The import keyword](https://dart.dev/language#imports)
- [The Material package](https://api.flutter.dev/flutter/material/material-library.html)

### The main Function

```dart
void main() {
  runApp(const HelloRandomColorApp());
}
```

The `main` function is the entry point of the app. It calls the `runApp` function which takes the `HelloRandomColorApp` widget and makes it the root of the widget tree. In this case, `HelloRandomColorApp` is a `StatelessWidget` that returns a `MaterialApp` widget, which is the foundation for a Flutter app with Material Design.

Read more about:

- [Building user interfaces with Flutter](https://docs.flutter.dev/ui)
- [The main function](https://dart.dev/language/functions#the-main-function)
- [The runApp function](https://api.flutter.dev/flutter/widgets/runApp.html)

### The HelloRandomColorApp widget

They often say that everything in Flutter is a widget. In this case, it's true, even for the app itself. The `HelloRandomColorApp` widget is a `StatelessWidget` that returns a `MaterialApp` widget.

```dart
/// The root widget of the app.
///
/// This is a stateless widget that uses the convenience [MaterialApp] widget to help us easily
/// build a Material Design app.
class HelloRandomColorApp extends StatelessWidget {
  /// Creates a new Hello Random Color app.
  const HelloRandomColorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return the root widget of the app, a [MaterialApp]
    return MaterialApp(
      // Hide the debug banner (this is an opionated developer choice)
      debugShowCheckedModeBanner: false,

      // The title of the app
      title: strings.appName,

      // The light theme of the app (default)
      // Use a color scheme based on white so it goes well with the random colors
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          onPrimary: Colors.black,
          secondary: Colors.white,
          onSecondary: Colors.black,
        ),
      ),

      // The dark theme of the app
      // Use a color scheme based on black so it goes well with the random colors
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.black,
          onSecondary: Colors.white,
        ),
      ),

      // The home screen of the app
      home: const HomeScreen(),
    );
  }
}
```

The `HelloRandomColorApp` widget is a `StatelessWidget` because it doesn't hold any internal state. Its role is to define the app's structure and appearance.

The constructor of the `HelloRandomColorApp` widget is a basic and empty constructor. It doesn't take any arguments because we don't need to pass any arguments to the widget.

The `build` method returns a `MaterialApp` widget, which is the foundation of a Flutter app with Material Design. The `MaterialApp` widget is a convenience widget that wraps a number of widgets that are commonly required for Material Design apps. It's a good starting point for building a Material Design app.

From the many properties of the `MaterialApp` widget, we use the following:

- `debugShowCheckedModeBanner`: We disable the debug banner even though this is a debug build. This is an opinionated developer choice. We believe that disabling the debug banner makes it easier to design the app's UI.

- `title`: This is the title of the app. We use a string constant from `strings.dart` for the app's title, demonstrating good practice in code reusability and maintainability.

- `theme` and `darkTheme`: These properties define the light and dark themes of the app. We use the `ThemeData` class to define the themes. We use the `brightness` property to define the brightness of the theme, and the `colorScheme` property to define some important colors of the theme, which are used by many widgets.

- `home`: Specifies the startup screen, `HomeScreen` in this case. This screen if the first screen that the user sees when launching the app.

Read more about:

- [Using Material Components](https://docs.flutter.dev/ui#using-material-components)
- [StatelessWidget class](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
- [MaterialApp class](https://api.flutter.dev/flutter/material/MaterialApp-class.html)
- [Use themes to share colors and font styles](https://docs.flutter.dev/cookbook/design/themes)




