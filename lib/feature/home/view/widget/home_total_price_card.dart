part of '../home_view.dart';

final class _TotalPriceCard extends StatelessWidget {
  const _TotalPriceCard({required this.totalSubPrice});

  final double totalSubPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              Text(
                'Toplam',
                style: context.general.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                radius: 30,
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
          ),
        ),
      ),
    );
  }
}
