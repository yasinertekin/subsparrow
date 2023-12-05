import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/auth/view/auth_view.dart';
import 'package:subsparrow/feature/register/view/register_view.dart';
import 'package:subsparrow/feature/register/view_model/register_view_model.dart';
import 'package:subsparrow/product/utility/auth_exception.dart';

/// [RegisterMixin] mixin
mixin RegisterMixin on State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  /// [formKey] getter
  GlobalKey<FormState> get formKey => _formKey;

  /// [emailController] getter
  TextEditingController get emailController => _emailController;
  final _emailController = TextEditingController();

  /// [emailController] getter
  TextEditingController get passwordController => _passwordController;
  final _passwordController = TextEditingController();

  /// [navigateToAuthScreen] Function
  void navigateToAuthScreen(BuildContext context) {
    context.route.navigateToPage(
      const AuthView(),
    );
  }

  /// [registerUserAndNavigate] Function
  Future<void> registerUserAndNavigate(
    RegisterViewModel userRegisterViewModel,
    BuildContext context,
  ) async {
    try {
      if (formKey.currentState!.validate()) {
        await userRegisterViewModel.userRegister(
          emailController.text,
          passwordController.text,
        );

        navigateToAuthScreen(context);
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
}
