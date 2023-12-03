part of '../home_view.dart';

final class _SubscriptionCard extends StatelessWidget {
  const _SubscriptionCard({
    required this.index,
    required this.users,
  });
  final int index;
  final Users? users;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: CustomNetworkImage(
            boxFit: BoxFit.fill,
            size: const Size(50, 50),
            emptyWidget: const Icon(
              Icons.error,
            ),
            loadingWidget: const CircularProgressIndicator(),
            imageUrl: users?.subscriptions[index].icon,
          ),
          title: Text(
            users?.subscriptions[index].platformName.toString() ?? '',
            style: context.general.textTheme.bodyLarge?.copyWith(),
          ),
          subtitle: Text(
            users?.subscriptions[index].name ?? '',
            style: context.general.textTheme.bodySmall?.copyWith(),
          ),
          trailing: Text(
            '${users?.subscriptions[index].price} ₺',
            style: context.general.textTheme.bodyLarge?.copyWith(),
          ),
        ),
      ),
    );
  }
}
