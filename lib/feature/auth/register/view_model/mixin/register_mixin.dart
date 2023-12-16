import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/auth/register/view/register_view.dart';
import 'package:subsparrow/feature/auth/register/view_model/register_view_model.dart';
import 'package:subsparrow/feature/auth/sign/view/auth_view.dart';
import 'package:subsparrow/product/utility/auth_exception.dart';
import 'package:widgets/src/widgets/custom_scaffold_messenger.dart';

/// [RegisterMixin] mixin
mixin RegisterMixin on State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser;

  /// [formKey] getter
  GlobalKey<FormState> get formKey => _formKey;

  /// [emailController] getter
  TextEditingController get emailController => _emailController;
  final _emailController = TextEditingController();

  /// [emailController] getter
  TextEditingController get passwordController => _passwordController;
  final _passwordController = TextEditingController();

  /// [nameController] getter
  TextEditingController get nameController => _nameController;
  final _nameController = TextEditingController();

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
          nameController.text,
        );

        navigateToAuthScreen(context);
      }
    } on AuthException catch (error) {
      CustomSnackBar.show(
        context: context,
        content: Text(error.message),
      );
    }

    initState() {
      super.initState();
      if (user != null) {
        context.route.navigateToPage(
          const AuthView(),
        );
      }
    }
  }
}
