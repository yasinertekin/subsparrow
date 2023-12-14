part of '../search_view.dart';

final class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
    required this.onChanged,
  });
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: TextField(
        autofocus: true,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: 'Aboneliklerimde Ara',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
