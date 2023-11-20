import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/auth/view/auth_view.dart';
import 'package:subsparrow/feature/dashboard/view/dashboard_view.dart';
import 'package:subsparrow/product/model/auth/auth.dart';
import 'package:subsparrow/product/service/auth_service.dart';

/// Mixin for [AuthView]
mixin AuthMixin on State<AuthView> {
  /// Controllers for [TextField]s
  final TextEditingController emailController = TextEditingController();

  /// Controllers for [TextField]s
  final TextEditingController passwordController = TextEditingController();

  /// Instance of [AuthService]
  final AuthService authService = AuthServices();

  /// Sign in
  Future<bool> signIn() async {
    return authService.signIn(
      Auth(),
      emailController,
      passwordController,
    );
  }

  /// Check status
  Future<void> checkStatus(BuildContext context) async {
    final result = await signIn();
    if (result) {
      // ignore: use_build_context_synchronously
      await context.route.navigateToPage(
        const DashboardView(),
      );
    } else {
      /// TODO: Show error message
      debugPrint('Giriş başarısız');
    }
  }
  /* Future<void> register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final user = userCredential.user;
        print('Kayıt olan kullanıcı: ${user?.email}');
      } catch (e) {
        print('Kayıt hatası: $e');
      }
    } else {
      print('E-posta ve parola boş olamaz');
    }
  }*/
}
