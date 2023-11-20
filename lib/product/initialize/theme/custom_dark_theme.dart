import 'package:flutter/src/material/floating_action_button_theme.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:subsparrow/product/initialize/theme/color_schemes.g.dart';
import 'package:subsparrow/product/initialize/theme/custom_theme.dart';

final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
      );

  @override
  // TODO: implement floatingActionButtonThemeData
  FloatingActionButtonThemeData get floatingActionButtonThemeData => const FloatingActionButtonThemeData();
}
