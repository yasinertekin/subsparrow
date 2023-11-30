part of '../dashboard_view.dart';

final class _BottomAppBar extends StatelessWidget {
  const _BottomAppBar({
    required this.tabController,
    required this.tabViewsList,
  });

  final TabController tabController;
  final List<Tab> tabViewsList;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: TabBar(
        onTap: (value) {},
        controller: tabController,
        tabs: tabViewsList,
      ),
    );
  }
}
