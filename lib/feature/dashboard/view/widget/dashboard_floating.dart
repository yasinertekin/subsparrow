part of '../dashboard_view.dart';

final class _DashboardFloating extends StatelessWidget {
  const _DashboardFloating();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        /*      addUser(
          FirebaseAuth.instance.currentUser!.uid,
          List<SubscriptionDetail>.empty(growable: true),
        );
        //  context.route.navigateToPage(const NewSubView());*/
        /*addSubscriptionDetail(
          FirebaseAuth.instance.currentUser!.uid,
          SubscriptionDetail(
            subIcon: '',
          ),
        );*/
        context.route.navigateToPage(
          const SubscriptionView(),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
