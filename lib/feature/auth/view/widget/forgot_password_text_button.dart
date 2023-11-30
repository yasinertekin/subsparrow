part of '../auth_view.dart';

final class _ForgotPasswordTextButton extends StatelessWidget {
  const _ForgotPasswordTextButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          StringConstants.forgotPassword,
          style: context.general.textTheme.labelLarge?.copyWith(),
        ),
      ),
    );
  }
}
