import 'package:flutter/material.dart';

/// A [ChangeNotifier] that manages the application theme data.
///
/// The [ThemeNotifier] class allows you to change
/// and notify listeners about changes
/// to the application theme. It extends [ChangeNotifier]
///  to provide a convenient

/// way of handling state changes.
///
/// Example usage:
/// ```dart
/// ThemeNotifier themeNotifier = ThemeNotifier(initialTheme);
///
/// // Retrieve the current theme
/// ThemeData currentTheme = themeNotifier.getTheme();
///.
/// // Set a new theme and notify listeners
/// themeNotifier.setTheme(newTheme);
/// ```
final class ThemeNotifier with ChangeNotifier {
  /// Creates a [ThemeNotifier] with the given initial [_themeData].
  ThemeNotifier(this._themeData);
  ThemeData _themeData;

  /// Retrieves the current theme data.
  ThemeData getTheme() => _themeData;

  /// Sets a new [themeData] and notifies listeners about the change.
  ///
  /// Example usage:
  /// ```dart
  /// themeNotifier.setTheme(newTheme);
  /// ```
  Future<void> setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}
