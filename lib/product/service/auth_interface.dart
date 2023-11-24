import 'package:flutter/material.dart';
import 'package:subsparrow/product/model/auth/auth.dart';

abstract class AuthService {
  Future<bool> signIn(
    UserModel auth,
    TextEditingController emailController,
    TextEditingController passwordController,
  );
}
