part of '../auth_view.dart';

final class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'StringConstants.password',
          style: context.general.textTheme.bodySmall?.copyWith(
            color: context.general.colorScheme.primary,
          ),
        ),
        //const Gap(2),
        TextField(
          textInputAction: TextInputAction.done,
          controller: passwordController,
          decoration: const InputDecoration(
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
            ),
          ),
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
