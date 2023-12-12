import 'package:flutter/material.dart';

/// [CustomSnackBar] is the class that displays the
final class CustomSnackBar {
  /// [CustomSnackBar] is the class that displays the
  static void show({
    required BuildContext context,
    required Widget content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content,
      ),
    );
  }
}
