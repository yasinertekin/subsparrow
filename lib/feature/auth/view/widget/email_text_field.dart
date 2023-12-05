part of '../auth_view.dart';

final class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return StringConstants.emailHint;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: StringConstants.email,
      ),
    );
  }
}
