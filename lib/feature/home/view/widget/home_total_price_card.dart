part of '../home_view.dart';

final class _TotalPriceCard extends StatelessWidget {
  const _TotalPriceCard({
    required this.totalSubPrice,
    required this.total,
    required this.homeViewModel,
  });

  final double totalSubPrice;
  final String total;
  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Column(
        children: [
          Text(
            maxLines: 1,
            total,
            style: context.general.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          CircleAvatar(
            radius: 30,
            child: Center(
              child: ListenableBuilder(
                listenable: homeViewModel,
                builder: (context, child) => Text(
                  maxLines: 1,
                  '${homeViewModel.totalPrice.toString()}₺',
                  style: context.general.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
