import 'package:flutter/material.dart';
import 'package:subsparrow/product/initialize/theme/color_schemes.g.dart';
import 'package:subsparrow/product/initialize/theme/custom_theme.dart';

final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        tabBarTheme: tabBarTheme,
      );

  @override
  // TODO: implement floatingActionButtonThemeData
  FloatingActionButtonThemeData get floatingActionButtonThemeData => const FloatingActionButtonThemeData();

  @override
  // TODO: implement tabBarTheme
  TabBarTheme get tabBarTheme => const TabBarTheme(
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelPadding: EdgeInsets.zero,
      );
}
