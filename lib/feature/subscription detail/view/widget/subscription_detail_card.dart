part of '../subscription_detail_view.dart';

final class _SubscriptionDetailCard extends StatelessWidget {
  const _SubscriptionDetailCard({
    required this.firebaseServices,
    required this.subscriptionData,
    required this.subscriptionViewModel,
    required this.users,
    required this.index,
  });

  final FirebaseServices firebaseServices;
  final SubscriptionData? subscriptionData;
  final SubscriptionViewModel subscriptionViewModel;
  final CollectionReference<Map<String, dynamic>> users;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          _upgradeSubscriptionsAndNavigate(
            context,
          );
        },
        title: Text(subscriptionData!.data.subscriptions![index].name!),
        subtitle: Text(
          '${subscriptionData!.data.subscriptions![index].price!} ₺',
        ),
      ),
    );
  }

  void _upgradeSubscriptionsAndNavigate(BuildContext context) {
    firebaseServices.upgradeSubscriptions(
      FirebaseAuth.instance.currentUser!.uid,
      subscriptionData!.data.subscriptions![index].copyWith(
        startDate: subscriptionViewModel.selectedDate,
        endDate: subscriptionViewModel.monthCount,
        status: true,
        icon: subscriptionData!.data.subscriptions![index].icon,
        name: subscriptionData!.data.subscriptions![index].name,
        price: subscriptionData!.data.subscriptions![index].price,
        platformName: subscriptionData!.data.subscriptions![index].platformName,
      ),
      users,
    );
    CustomSnackBar.show(
      context: context,
      content: const Row(
        children: [
          Text('Aboneliğiniz başarıyla Eklendi'),
          Icon(
            Icons.check,
            color: Colors.black,
          ),
        ],
      ),
    );

    context.route.navigateToPage(
      const DashboardView(),
    );
  }
}
