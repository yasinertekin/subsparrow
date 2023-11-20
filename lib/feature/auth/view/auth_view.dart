import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/auth/view/mixin/auth_mixin.dart';

part './widget/email_text_field.dart';
part 'widget/forgot_password_text_button.dart';
part 'widget/login_button.dart';
part 'widget/password_text_field.dart';
part 'widget/register_text_button.dart';

///
final class AuthView extends StatefulWidget {
  ///  {@macro auth_view}
  const AuthView({super.key});

  @override

  /// {@macro auth_view_state}
  // ignore: library_private_types_in_public_api
  _AuthViewState createState() => _AuthViewState();
}

final class _AuthViewState extends State<AuthView> with AuthMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _AuthViewHeader(),
            _AuthViewBody(
              emailController: emailController,
              passwordController: passwordController,
              onPressed: () => checkStatus(context),
            ),
          ],
        ),
      ),
    );
  }
}

final class _AuthViewBody extends StatelessWidget {
  const _AuthViewBody({
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Column(
        children: [
          _EmailTextField(emailController: emailController),
          _PasswordTextField(passwordController: passwordController),
          const _ForgotPasswordTextButton(),
          _LoginButton(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

final class _AuthViewHeader extends StatelessWidget {
  const _AuthViewHeader();

  @override
  Widget build(BuildContext context) {
    const height = 116.49;
    const width = 105.82;
    return Column(
      children: [
        Text(
          ' StringConstants.login',
          style: context.general.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
