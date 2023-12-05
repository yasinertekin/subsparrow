import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/auth/view/auth_view.dart';
import 'package:subsparrow/feature/auth/view_model/auth_view_model.dart';
import 'package:subsparrow/feature/dashboard/view/dashboard_view.dart';
import 'package:subsparrow/product/utility/auth_exception.dart';

/// A mixin for [AuthView] providing common authentication functionality.
///
/// This mixin includes a [formKey] for managing the form state,
/// [emailController] for handling email input, and
/// [passwordController] for managing password input.
mixin AuthMixin on State<AuthView> {
  /// A key to uniquely identify and manage the form state.
  final _formKey = GlobalKey<FormState>();

  /// Getter for the form key.
  GlobalKey<FormState> get formKey => _formKey;

  /// Controller for handling email input in the authentication form.
  TextEditingController emailController = TextEditingController();

  /// Controller for handling password input in the authentication form.
  TextEditingController passwordController = TextEditingController();

  /// [signInUserAndNavigate] Function
  Future<void> signInUserAndNavigate(
    AuthViewModel userRegisterViewModel,
    BuildContext context,
  ) async {
    try {
      if (formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Giriş yapılıyor...'),
          ),
        );
        await userRegisterViewModel.signIn(
          emailController.text,
          passwordController.text,
        );

        navigateToDashboardView(
          context,
        );
      }
    } on AuthException catch (error) {
      // Handle and display the error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$error'),
        ),
      );
    }
  }

  /// [navigateToDashboardView] Function
  void navigateToDashboardView(BuildContext context) {
    context.route.navigateToPage(const DashboardView());
  }
}
