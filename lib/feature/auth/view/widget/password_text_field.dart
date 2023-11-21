part of '../auth_view.dart';

final class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.done,
      controller: passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
        suffixIcon: Icon(
          Icons.visibility_off_outlined,
        ),
      ),
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
