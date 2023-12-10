// Copyright 2023 eduhoratiu (https://eduhoratiu.com/)
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/strings.dart' as strings;
import '../common/urls.dart' as urls;
import '../utils/color_utils.dart' as color_utils;
import '../utils/utils.dart' as utils;
import '../widgets/color_display.dart';
import 'color_preview_screen.dart';

/// The Home screen of the app.
///
/// This screen is the main screen of the app, and displays a random color.
///
/// The screen is filled with the random color, and displays the hexadecimal color code in the
/// center. The user can shuffle the color being displayed, and can also copy the color code to the
/// clipboard, or navigate to the Color Preview screen.
class HomeScreen extends StatefulWidget {
  /// Creates a new Home screen.
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// The state of the Home screen.
class _HomeScreenState extends State<HomeScreen> {
  /// The current random color being displayed.
  late Color _randomColor;

  /// Generates a random color when the state is initialized.
  @override
  void initState() {
    super.initState();
    _shuffleColor(changeState: false);
  }

  /// Shuffles the random color being displayed, and optionally updates the state of the widget.
  void _shuffleColor({bool changeState = true}) {
    _randomColor = color_utils.randomColor();
    if (changeState) setState(() {});
  }

  /// Perform the actions of the app bar.
  void _onAppBarAction(_AppBarActions action) {
    switch (action) {
      // Navigate to the Color Preview screen
      case _AppBarActions.colorPreview:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ColorPreviewScreen(color: _randomColor),
          ),
        );
        break;

      // Copy the color code to the clipboard
      case _AppBarActions.copy:
        (() async {
          ScaffoldMessengerState messengerState = ScaffoldMessenger.of(context);
          String colorCode = color_utils.toHexString(_randomColor);
          try {
            await Clipboard.setData(ClipboardData(text: colorCode));
            utils.showSnackBar(messengerState, strings.copiedSnack(colorCode));
          } catch (error) {
            utils.showSnackBar(
                messengerState, strings.copiedErrorSnack(colorCode));
          }
        }());
        break;

      // Open the app home page in the default browser
      case _AppBarActions.about:
        utils.launchUrlExternal(context, urls.aboutUrl);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The app bar with the title and main actions
      appBar: _AppBar(
        onAction: _onAppBarAction,
      ),

      // The body of the screen is the color display widget that is filled with the random color and
      // displays the hexadecimal color code in the center, also animating color changes
      body: ColorDisplay(
        color: _randomColor,
      ),

      // The floating action button is used to shuffle the color being displayed
      floatingActionButton: FloatingActionButton.large(
        tooltip: strings.homeFabTooltip,
        onPressed: () => _shuffleColor(),
        child: const Icon(Icons.shuffle_rounded),
      ),
    );
  }
}

/// The actions available in the app bar.
enum _AppBarActions { colorPreview, copy, about }

/// The app bar of the Home Screen.
class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    Key? key,
    required this.onAction,
  }) : super(key: key);

  /// The callback that is called when an app bar action is pressed.
  final Function(_AppBarActions action) onAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(strings.homeScreenTitle),
      actions: <Widget>[
        // The color preview action
        IconButton(
          icon: const Icon(Icons.visibility_rounded),
          tooltip: strings.colorPreviewActionTooltip,
          onPressed: () => onAction(_AppBarActions.colorPreview),
        ),
        PopupMenuButton<_AppBarActions>(
          onSelected: onAction,
          itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<_AppBarActions>>[
            // The copy color code action
            const PopupMenuItem<_AppBarActions>(
              value: _AppBarActions.copy,
              child: Text(strings.copyAction),
            ),
            // The app homepage action
            const PopupMenuItem<_AppBarActions>(
              value: _AppBarActions.about,
              child: Text(strings.aboutAction),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
