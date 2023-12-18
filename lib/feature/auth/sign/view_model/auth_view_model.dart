import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subsparrow/product/service/auth_interface.dart';
import 'package:subsparrow/product/utility/auth_exception.dart';

/// [AuthViewModel] view model
final class AuthViewModel extends ChangeNotifier {
  /// Default constructor
  AuthViewModel(this.authService);

  /// [authService] is the service that is used for authentication.
  final AuthService authService;

  /// [signIn] Function
  Future<void> signIn(String email, String password) async {
    try {
      await authService.signInEmailAndPassword(email, password);
      // Giriş başarılıysa, burada gerekli bildirimleri yapabilirsiniz.
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is badly formatted.';
      } else {
        errorMessage = 'Error during login: $e';
      }

      throw AuthException(errorMessage);
    }
  }
}
