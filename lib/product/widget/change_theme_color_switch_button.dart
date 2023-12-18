// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsparrow/product/base/theme_notifier.dart';
import 'package:subsparrow/product/initialize/theme/custom_dark_theme.dart';
import 'package:subsparrow/product/initialize/theme/custom_light_theme.dart';

/// The change theme color switch button widget.
final class ChangeThemeColorSwitchButton extends StatelessWidget {
  /// [ChangeThemeColorSwitchButton] default constructor
  const ChangeThemeColorSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Switch(
          value: themeNotifier.getTheme() == CustomDarkTheme().themeData,
          onChanged: (value) {
            _changeTheme(value, themeNotifier);
          },
        );
      },
    );
  }

  void _changeTheme(bool value, ThemeNotifier themeNotifier) {
    if (value) {
      themeNotifier.setTheme(CustomDarkTheme().themeData);
    } else {
      themeNotifier.setTheme(CustomLightTheme().themeData);
    }
  }
}
