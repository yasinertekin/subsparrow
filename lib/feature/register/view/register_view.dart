import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:subsparrow/feature/register/view/mixin/register_mixin.dart';
import 'package:subsparrow/feature/register/view_model/register_view_model.dart';

part 'widget/email_text_field.dart';
part 'widget/password_text_field.dart';
part 'widget/register_app_bar.dart';
part 'widget/register_button.dart';
part 'widget/sign_in_text_button.dart';

/// The main registration view widget.
final class RegisterView extends StatefulWidget {
  /// [RegisterView] default constructor
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with RegisterMixin {
  @override
  Widget build(BuildContext context) {
    final userRegisterViewModel = Provider.of<UserRegisterViewModel>(context);
    return Scaffold(
      appBar: const _RegisterAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Assets.icons.icRegisterBird.svg(
              package: 'gen',
              height: context.sized.dynamicHeight(
                context.general.isKeyBoardOpen == true ? 0.10 : 0.45,
              ),
            ),
            _CustomForm(
              formKey: formKey,
              emailController: emailController,
              passwordController: passwordController,
            ),
            _SignInTextButton(
              onPressed: () => navigateToAuthScreen(context),
            ),
            _RegisterButton(
              onPressed: () async {
                await registerUserAndNavigate(
                  userRegisterViewModel,
                  context,
                );
              },
            ),
          ],
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
    return Padding(
      padding: context.padding.low,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _EmailTextField(
              emailController: emailController,
            ),
            const Gap(15),
            _PasswordTextField(passwordController: passwordController),
          ],
        ),
      ),
    );
  }
}
