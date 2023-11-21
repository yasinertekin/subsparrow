import 'package:flutter/material.dart';
import 'package:subsparrow/feature/auth/view/auth_view.dart';

/// Mixin for [AuthView]
mixin AuthMixin on State<AuthView> {
  /// Controllers for [TextField]s
  final TextEditingController emailController = TextEditingController();

  /// Controllers for [TextField]s
  final TextEditingController passwordController = TextEditingController();
}
