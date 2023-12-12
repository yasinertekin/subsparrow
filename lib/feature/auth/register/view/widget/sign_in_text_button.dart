part of '../register_view.dart';

final class _SignInTextButton extends StatelessWidget {
  const _SignInTextButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: const Text('Zaten bir hesabım var'),
      ),
    );
  }
}
