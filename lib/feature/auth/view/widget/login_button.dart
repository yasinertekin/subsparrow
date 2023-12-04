part of '../auth_view.dart';

final class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 6,
        ),
        onPressed: onPressed,
        child: const Text('Giriş yap'),
      ),
    );
  }
}
