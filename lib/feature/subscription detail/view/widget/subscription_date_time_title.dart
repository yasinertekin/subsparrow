part of '../subscription_detail_view.dart';

// ignore: unused_element
final class _DateTimeTitle extends StatelessWidget {
  const _DateTimeTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Abonelik Başlangıç Tarihiniz',
          style: context.general.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
