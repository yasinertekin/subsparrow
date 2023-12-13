// ignore_for_file: use_build_context_synchronously

part of '../subscription_view.dart';

final class _SubscriptionViewCard extends StatelessWidget {
  const _SubscriptionViewCard({
    required this.subscriptionData,
    required this.index,
    required this.subscriptionViewModel,
  });

  final List<SubscriptionData> subscriptionData;
  final int index;
  final SubscriptionViewModel subscriptionViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Card(
        elevation: 7,
        child: _CustomListTile(
          subscriptionViewModel: subscriptionViewModel,
          subscriptionData: subscriptionData,
          index: index,
        ),
      ),
    );
  }
}

final class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.subscriptionViewModel,
    required this.subscriptionData,
    required this.index,
  });

  final SubscriptionViewModel subscriptionViewModel;
  final List<SubscriptionData> subscriptionData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.route.navigateToPage(
          _SubscriptionDateTimePicker(
            subViewModel: subscriptionViewModel,
            subDetail: subscriptionData[index].data.subscriptions?[index],
            subscriptionData: subscriptionData[index],
          ),
        );
      },
      leading: _CustomListTileLeading(
        subscriptionData: subscriptionData,
        index: index,
      ),
      title: _CustomListTileTitle(
        subscriptionData: subscriptionData,
        index: index,
      ),
      trailing: const Icon(
        Icons.add,
      ),
    );
  }
}

final class _CustomListTileTitle extends StatelessWidget {
  const _CustomListTileTitle({
    required this.subscriptionData,
    required this.index,
  });

  final List<SubscriptionData> subscriptionData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      subscriptionData[index].id,
      style: context.general.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

final class _CustomListTileLeading extends StatelessWidget {
  const _CustomListTileLeading({
    required this.subscriptionData,
    required this.index,
  });

  final List<SubscriptionData> subscriptionData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: CustomNetworkImage(
        boxFit: BoxFit.contain,
        size: Size(
          context.sized.dynamicHeight(0.05),
          context.sized.dynamicHeight(0.10),
        ),
        emptyWidget: const Icon(Icons.error),
        loadingWidget: const CircularProgressIndicator(),
        imageUrl: subscriptionData[index].data.subscriptions?[index].icon,
      ),
    );
  }
}
