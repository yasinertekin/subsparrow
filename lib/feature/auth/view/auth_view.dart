import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/auth/view/mixin/auth_mixin.dart';
import 'package:subsparrow/feature/auth/view_model/auth_init_notifier.dart';
import 'package:subsparrow/feature/auth/view_model/cubit/auth_cubit.dart';
import 'package:subsparrow/feature/auth/view_model/state/auth_state.dart';
import 'package:subsparrow/feature/dashboard/view/dashboard_view.dart';
import 'package:subsparrow/product/constants/string_constants.dart';
import 'package:subsparrow/product/model/auth/auth.dart';

part 'widget/email_text_field.dart';
part 'widget/forgot_password_text_button.dart';
part 'widget/login_button.dart';
part 'widget/password_text_field.dart';
part 'widget/register_text_button.dart';

/// View for user authentication
final class AuthView extends StatefulWidget {
  /// Constructor for [AuthView]
  const AuthView({
    super.key,
  });

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> with AuthMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringConstants.welcomeSubSparrow,
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case AuthInitial:
              return _AuthInit(
                emailController: emailController,
                passwordController: passwordController,
              );
            case AuthLoading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case AuthSuccess:
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.route.navigateToPage(
                  const DashboardView(),
                );
              });
              return const SizedBox.shrink();

            case AuthFailure:
              return ListView(
                children: [
                  _AuthInit(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  Text(
                    '${StringConstants.wrongMessage}${(state as AuthFailure).error}',
                  ),
                ],
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

final class _AuthInit extends StatelessWidget {
  const _AuthInit({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final authInitNotifier = AuthInitNotifier();
    return ListenableBuilder(
      listenable: authInitNotifier,
      builder: (BuildContext context, Widget? child) => Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: authInitNotifier.keyboardOpen ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
            children: [
              Assets.icons.icAuth.svg(
                package: 'gen',
                height:
                    authInitNotifier.keyboardOpen ? context.sized.dynamicHeight(0.2) : context.sized.dynamicHeight(0.4),
              ),
              _EmailTextField(
                authInitNotifier: authInitNotifier,
                emailController: emailController,
              ),
              _PasswordTextField(
                passwordController: passwordController,
              ),
              if (context.general.isKeyBoardOpen)
                const SizedBox.shrink()
              else
                Column(
                  children: [
                    const _ForgotPasswordTextButton(),
                    _LoginButton(
                      onPressed: () {
                        _signInControl(context);
                      },
                    ),
                    const _RegisterTextButton(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _signInControl(BuildContext context) {
    emailController.text.isNotEmpty && passwordController.text.isNotEmpty
        ? context.read<AuthCubit>().signIn(
              UserModel(
                email: passwordController.text,
                password: passwordController.text,
              ),
              emailController,
              passwordController,
            )
        : ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                StringConstants.snackbarMessage,
              ),
              duration: const Duration(seconds: 2),
              action: SnackBarAction(
                label: StringConstants.snackbarLabel,
                onPressed: () {},
              ),
            ),
          );
  }
}
