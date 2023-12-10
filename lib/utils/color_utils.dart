// Copyright 2023 eduhoratiu (https://eduhoratiu.com/)
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

/// A collection of utility functions for working with colors.
library;

import 'dart:math';

import 'package:flutter/material.dart';

/// A random number generator used to generate random colors.
Random _random = Random();

/// Generates a random color.
Color randomColor() {
  return Color.fromARGB(
    255,
    _random.nextInt(256),
    _random.nextInt(256),
    _random.nextInt(256),
  );
}

/// Returns the black or white contrast color of the given [Color].
Color contrastColor(Color color) {
  switch (ThemeData.estimateBrightnessForColor(color)) {
    case Brightness.light:
      return Colors.black;
    case Brightness.dark:
      return Colors.white;
  }
}

/// Returns the hexadecimal string representation of the given [Color].
String toHexString(Color color, {bool withHash = true}) {
  final String hex =
      (color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase();
  return withHash ? '#$hex' : hex;
}
