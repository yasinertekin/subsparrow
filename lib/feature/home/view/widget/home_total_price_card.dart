part of '../home_view.dart';

final class _TotalPriceCard extends StatelessWidget {
  const _TotalPriceCard({required this.totalSubPrice});

  final double totalSubPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          'Toplam',
          style: context.general.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          '$totalSubPrice TL',
          style: context.general.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
