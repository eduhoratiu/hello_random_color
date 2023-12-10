// Copyright 2023 eduhoratiu (https://eduhoratiu.com/)
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'common/strings.dart' as strings;
import 'screens/home_screen.dart';

/// The entry point of the app.
void main() {
  runApp(const HelloRandomColorApp());
}

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
