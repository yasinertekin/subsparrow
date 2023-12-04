part of '../register_view.dart';

final class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Şifre',
      ),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      controller: passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Lütfen bir şifre giriniz';
        }
        return null;
      },
    );
  }
}
