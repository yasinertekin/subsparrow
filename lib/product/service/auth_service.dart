import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subsparrow/product/model/auth/auth.dart';

abstract class AuthService {
  Future<bool> signIn(Auth auth, TextEditingController emailController, TextEditingController passwordController);
}

final class AuthServices extends AuthService {
  @override
  Future<bool> signIn(
    Auth auth,
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

  Future<void> tokenSaveToCache(String token) async {}
}
