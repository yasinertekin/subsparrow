part of '../home_view.dart';

final class _TotalPriceCard extends StatelessWidget {
  const _TotalPriceCard({
    required this.totalSubPrice,
    required this.total,
  });

  final double totalSubPrice;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Column(
        children: [
          Text(
            total,
            style: context.general.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          CircleAvatar(
            radius: 30,
            child: Center(
              child: Text(
                '${totalSubPrice.toString()}₺',
                style: context.general.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
