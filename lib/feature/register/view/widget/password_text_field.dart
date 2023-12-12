part of '../register_view.dart';

final class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final passwordTextFieldNotifier = PasswordNotifierTwo();

    return ListenableBuilder(
      listenable: passwordTextFieldNotifier,
      builder: (context, child) => TextFormField(
        obscureText: passwordTextFieldNotifier.obscureText,
        decoration: InputDecoration(
          labelText: 'Şifre',
          suffixIcon: IconButton(
            onPressed: passwordTextFieldNotifier.changeObscureText,
            icon: Icon(
              passwordTextFieldNotifier.obscureText == true ? Icons.visibility : Icons.visibility_off,
            ),
          ),
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
      ),
    );
  }
}

/// Şifre alanı için notifier
final class PasswordNotifierTwo extends ChangeNotifier {
  bool _obscureText = true;

  /// Şifre alanının görünürlüğünü değiştirir
  bool get obscureText => _obscureText;

  /// Şifre alanının görünürlüğünü değiştirir
  void changeObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }
}
