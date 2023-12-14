import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:subsparrow/feature/dashboard/view/mixin/dashboard_mixin.dart';
import 'package:subsparrow/feature/home/view/home_view.dart';
import 'package:subsparrow/feature/profile/view/profile_view.dart';
import 'package:subsparrow/feature/subscription/view/subscription_view.dart';
import 'package:subsparrow/product/utility/enum/tab_view.dart';

part 'widget/bottom_app_bar.dart';

/// DashboardView
final class DashboardView extends StatefulWidget {
  /// DashboardView
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with DashBoardMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabViews.values.length,
      child: Scaffold(
        bottomNavigationBar: _BottomAppBar(
          tabController: tabController,
          tabViewsList: tabViews,
        ),
        body: _DashboardView(
          tabController: tabController,
        ),
      ),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

final class _DashboardView extends StatelessWidget {
  const _DashboardView({
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [
        HomeView(),
        SubscriptionView(),
        ProfileView(),
      ],
    );
  }
}
