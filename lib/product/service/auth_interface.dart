import 'package:flutter/material.dart';
import 'package:subsparrow/product/model/auth/auth.dart';

/// AuthService
abstract class AuthService {
  /// Returns the current user.
  Future<bool> signIn(
    UserModel auth,
    TextEditingController emailController,
    TextEditingController passwordController,
  );
}
