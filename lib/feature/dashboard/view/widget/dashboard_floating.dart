part of '../dashboard_view.dart';

final class _DashboardFloating extends StatelessWidget {
  const _DashboardFloating();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.route.navigateToPage(
          const SubscriptionView(),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
