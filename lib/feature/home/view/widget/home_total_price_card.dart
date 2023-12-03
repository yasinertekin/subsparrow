part of '../home_view.dart';

final class _TotalPriceCard extends StatelessWidget {
  const _TotalPriceCard({required this.totalSubPrice});

  final double totalSubPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Toplam Harcama',
          style: context.general.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        CircleAvatar(
          radius: 50,
          child: Center(
            child: Text(
              totalSubPrice.toString(),
              style: context.general.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
