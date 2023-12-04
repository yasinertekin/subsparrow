import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subsparrow/product/service/auth_interface.dart';

/// [CustomAuthProvider] view model
final class CustomAuthProvider extends ChangeNotifier {
  /// Defauult constructor
  CustomAuthProvider(this._authService);
  final AuthService _authService;

  /// [signIn] Function
  Future<void> signIn(String email, String password) async {
    try {
      await _authService.signInEmailAndPassword(email, password);
      // Giriş başarılıysa, burada gerekli bildirimleri yapabilirsiniz.
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user.';
      } else {
        throw 'Error during login: $e';
      }
    }
  }
}
