part of '../home_view.dart';

final class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: HomeGridViewBuilder.values.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: context.sized.dynamicHeight(0.0015),
      ),
      itemBuilder: (BuildContext context, int index) {
        final item = HomeGridViewBuilder.values[index];
        return _CustomCircleAvatar(
          title: item.title,
          value: item.getPrice(
            totalPrice: homeViewModel.totalPrice.toStringAsFixed(
              2,
            ),
            monthlyPrice: homeViewModel.monthlyPrice.toStringAsFixed(
              2,
            ),
            subCount: homeViewModel.subCount.toString(),
          ),
        );
      },
    );
  }
}
