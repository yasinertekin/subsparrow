part of '../auth_view.dart';

final class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const height = 0.06;
    const fontSize = 20.0;
    return SizedBox(
      width: double.infinity,
      height: context.sized.dynamicHeight(height),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          StringConstants.login,
          style: context.general.textTheme.titleLarge?.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
