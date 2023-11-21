import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/auth/view/mixin/auth_mixin.dart';
import 'package:subsparrow/feature/auth/view_model/cubit/auth_cubit.dart';
import 'package:subsparrow/feature/auth/view_model/state/auth_state.dart';
import 'package:subsparrow/feature/dashboard/view/dashboard_view.dart';
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
        title: const Text('User Authentication'),
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
              return const SizedBox();

            case AuthFailure:
              return Center(
                child: Column(
                  children: [
                    _AuthInit(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    Text(
                      'Something went wrong: ${(state as AuthFailure).error}',
                    ),
                  ],
                ),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}

class _AuthInit extends StatelessWidget {
  const _AuthInit({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Enter your email and password to sign in',
          ),
          _EmailTextField(
            emailController: emailController,
          ),
          _PasswordTextField(
            passwordController: passwordController,
          ),
          _LoginButton(
            onPressed: () {
              context.read<AuthCubit>().signIn(
                    UserModel(
                      email: passwordController.text,
                      password: passwordController.text,
                    ),
                    emailController,
                    passwordController,
                  );
            },
          ),
        ],
      ),
    );
  }
}
