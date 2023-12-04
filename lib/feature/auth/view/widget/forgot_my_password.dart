part of '../auth_view.dart';

final class _ForgotMyPassword extends StatelessWidget {
  const _ForgotMyPassword();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Şifremi Unuttum',
          style: context.general.textTheme.bodyMedium?.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
