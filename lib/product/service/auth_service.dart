import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subsparrow/product/model/auth/auth.dart';
import 'package:subsparrow/product/service/auth_interface.dart';

/// This class is responsible for creating auth service object
final class AuthServices extends AuthService {
  @override
  Future<bool> signIn(
    UserModel auth,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    auth
      ..email = emailController.text.trim()
      ..password = passwordController.text.trim();
    if (auth.email!.isNotEmpty && auth.password!.isNotEmpty) {
      try {
        final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: auth.email ?? '',
          password: auth.password ?? '',
        );
        final user = userCredential.user;

        return user != null;
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }

  /// Returns the current user.
  Future<void> tokenSaveToCache(String token) async {}
}
