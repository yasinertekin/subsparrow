import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:subsparrow/feature/auth/register/view/register_view.dart';
import 'package:subsparrow/feature/auth/sign/view/mixin/auth_mixin.dart';
import 'package:subsparrow/feature/auth/sign/view_model/auth_view_model.dart';
import 'package:subsparrow/product/utility/constants/string_constants.dart';

part './widget/email_text_field.dart';
part './widget/forgot_my_password.dart';
part './widget/login_button.dart';
part './widget/password_text_field.dart';
part './widget/register_text_button.dart';

/// The main authentication view widget.
/// This widget includes a login form with email and password fields.
final class AuthView extends StatefulWidget {
  /// [AuthView] default constructor
  const AuthView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthViewState createState() => _AuthViewState();
}

final class _AuthViewState extends State<AuthView> with AuthMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.padding.low,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.icAuth.svg(
                package: 'gen',
                height: context.sized.dynamicHeight(
                  context.general.isKeyBoardOpen == true ? 0.15 : 0.45,
                ),
              ),
              _CustomForm(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const _ForgotMyPassword(),
              _LoginButton(
                onPressed: () async {
                  await signInUserAndNavigate(
                    context.read<AuthViewModel>(),
                    context,
                  );
                },
              ),
              const _RegisterTextButton(),
            ],
          ),
        ),
      ),
    );
  }
}

final class _CustomForm extends StatelessWidget {
  const _CustomForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _EmailTextField(emailController: emailController),
          const Gap(15),
          _PasswordTextField(passwordController: passwordController),
        ],
      ),
    );
  }
}
