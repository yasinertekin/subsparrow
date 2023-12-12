part of '../auth_view.dart';

final class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final passwordNotifier = Provider.of<PasswordNotifier>(context);
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return StringConstants.passwordHint;
        }
        return null;
      },
      obscureText: passwordNotifier.isObscure,
      decoration: InputDecoration(
        labelText: StringConstants.password,
        suffixIcon: IconButton(
          onPressed: passwordNotifier.toggleObscure,
          icon: passwordNotifier.isObscure
              ? const Icon(Icons.visibility)
              : const Icon(
                  Icons.visibility_off,
                ),
        ),
      ),
    );
  }
}

/// A [ChangeNotifier] class for managing password visibility.
final class PasswordNotifier extends ChangeNotifier {
  bool _isObscure = true;

  /// Getter for [_isObscure].
  bool get isObscure => _isObscure;

  /// Toggle [_isObscure] value.
  void toggleObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}
