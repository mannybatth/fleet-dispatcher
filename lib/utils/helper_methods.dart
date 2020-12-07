import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

void copyToClipboard(BuildContext context, String text) {
  FlutterClipboard.copy(text).then((value) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('Copied to clipboard!'))));
}
