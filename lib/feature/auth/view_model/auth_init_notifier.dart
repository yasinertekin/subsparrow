import 'package:flutter/material.dart';

/// AuthInitNotifier
class AuthInitNotifier extends ChangeNotifier {
  /// Keyboard open
  bool keyboardOpen = false;

  /// Set keyboard open
  void setKeyboardOpen({required bool value}) {
    keyboardOpen = value;
    notifyListeners();
  }
}
