import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/dashboard/view/mixin/dashboard_mixin.dart';
import 'package:subsparrow/feature/home/view/home_view.dart';
import 'package:subsparrow/feature/subscription/view/subscription_view.dart';
import 'package:subsparrow/product/enum/tab_view.dart';
import 'package:subsparrow/product/extensions/tab_icons.dart';

final class DashboardView extends StatefulWidget {
  /// DashboardView
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

final class _DashboardViewState extends State<DashboardView> with DashBoardMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabViews.values.length,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
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
              const SubscriptionView(
                user: null,
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: _myDashboardView(),
        ),
        body: _DashboardView(tabController: tabController),
      ),
    );
  }

  TabBar _myDashboardView() {
    final tabViewsList = TabViews.values
        .map(
          (e) => Tab(
            text: formatEnumName(e.name),
            icon: Icon(e.icon),
          ),
        )
        .toList();
    return TabBar(
      onTap: (value) {},
      controller: tabController,
      tabs: tabViewsList,
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
      children: [
        const HomeView(),
        Assets.icons.icRobinBird.svg(
          package: 'gen',
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.red,
        ),
      ],
    );
  }
}
