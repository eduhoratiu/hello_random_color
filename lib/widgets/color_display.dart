// Copyright 2023 eduhoratiu (https://eduhoratiu.com/)
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../utils/color_utils.dart' as color_utils;

/// The color display widget.
///
/// The widget is filled with the specified color, and displays the hexadecimal color code in the
/// center. It also animates color changes.
class ColorDisplay extends StatelessWidget {
  const ColorDisplay({
    Key? key,
    required this.color,
  }) : super(key: key);

  /// The color to display.
  final Color color;

  @override
  Widget build(BuildContext context) {
    final Color contrastColor = color_utils.contrastColor(color);

    // Use an AnimatedContainer to animate the color change
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      color: color,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),

      // Use a simple Text widget to display the hexadecimal color code
      child: Text(
        color_utils.toHexString(color),
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: contrastColor),
      ),
    );
  }
}
