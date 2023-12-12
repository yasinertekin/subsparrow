part of '../register_view.dart';

final class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: context.padding.low,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 5,
          ),
          onPressed: onPressed,
          child: const Text('Üye ol'),
        ),
      ),
    );
  }
}
