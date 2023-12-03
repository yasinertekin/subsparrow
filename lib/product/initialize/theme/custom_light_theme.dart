import 'package:flutter/material.dart';
import 'package:subsparrow/product/initialize/theme/color_schemes.g.dart';
import 'package:subsparrow/product/initialize/theme/custom_theme.dart';

/// CustomLightTheme
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.lightColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        tabBarTheme: tabBarTheme,
        inputDecorationTheme: inputDecorationTheme,
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData => const FloatingActionButtonThemeData();

  @override
  TabBarTheme get tabBarTheme => const TabBarTheme(
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelPadding: EdgeInsets.zero,
      );

  @override
  InputDecorationTheme get inputDecorationTheme => const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      );
}
