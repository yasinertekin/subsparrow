part of '../auth_view.dart';

final class _RegisterTextButton extends StatelessWidget {
  const _RegisterTextButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Hesabınız yok mu?',
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Hesap oluştur',
            style: context.general.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
        ),
      ],
    );
  }
}
