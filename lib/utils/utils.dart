// Copyright 2023 eduhoratiu (https://eduhoratiu.com/)
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

/// Shows a [SnackBar] with the specified [text].
void showSnackBar(ScaffoldMessengerState messengerState, String text) {
  final SnackBar snackBar = SnackBar(content: Text(text));
  messengerState
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}

/// Launches the specified [URL] using the default external application.
///
/// Shows an error [SnackBar] if there is no support for launching the URL.
Future<void> launchUrlExternal(BuildContext context, String url) async {
  ScaffoldMessengerState messengerState = ScaffoldMessenger.of(context);
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    showSnackBar(messengerState, 'Failed to open $url');
  }
}
