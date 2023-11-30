part of '../auth_view.dart';

final class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final _PasswordTextFieldNotifier notifier = _PasswordTextFieldNotifier();

    return Padding(
      padding: context.padding.low,
      child: ListenableBuilder(
        listenable: notifier,
        builder: (BuildContext context, Widget? child) => TextField(
          textInputAction: TextInputAction.done,
          controller: passwordController,
          decoration: InputDecoration(
            labelText: StringConstants.password,
            suffixIcon: IconButton(
              icon: Icon(
                notifier.obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: notifier.changeObscureText,
            ),
          ),
          obscureText: notifier.obscureText,
          keyboardType: TextInputType.visiblePassword,
        ),
      ),
    );
  }
}

final class _PasswordTextFieldNotifier extends ChangeNotifier {
  /// PasswordTextFieldNotifier constructor
  _PasswordTextFieldNotifier() {
    passwordController = TextEditingController();
  }

  /// passwordController
  late TextEditingController passwordController;

  bool obscureText = false;

  /// dispose
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  /// changeObscureText
  void changeObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
