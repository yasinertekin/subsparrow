import 'package:flutter/material.dart';

/// An abstract class representing a custom theme configuration.
abstract class CustomTheme {
  /// The primary [ThemeData] for the application.
  ThemeData get themeData;

  /// The [FloatingActionButtonThemeData] for the application.
  FloatingActionButtonThemeData get floatingActionButtonThemeData;

  /// The [TabBarTheme] for the application.
  TabBarTheme get tabBarTheme;

  /// The [InputDecorationTheme] for form input elements.
  InputDecorationTheme get inputDecorationTheme;
}
