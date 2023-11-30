import 'package:flutter/material.dart';

/// AuthInitNotifier
final class AuthInitNotifier extends ChangeNotifier {
  /// Keyboard open
  bool keyboardOpen = false;

  /// Set keyboard open
  void setKeyboardOpen(bool value) {
    keyboardOpen = value;
    notifyListeners();
  }
}
