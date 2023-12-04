part of '../register_view.dart';

final class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Lütfen bir email giriniz';
        }
        return null;
      },
    );
  }
}
