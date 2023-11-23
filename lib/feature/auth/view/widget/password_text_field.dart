part of '../auth_view.dart';

final class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: TextField(
        textInputAction: TextInputAction.done,
        controller: widget.passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
        obscureText: _obscureText, // Use the boolean here
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }
}
