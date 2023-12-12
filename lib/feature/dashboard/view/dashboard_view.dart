import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:subsparrow/feature/dashboard/view/mixin/dashboard_mixin.dart';
import 'package:subsparrow/feature/dashboard/view_model/dashboard_view_model.dart';
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
          viewModel: viewModel,
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
    required this.viewModel,
  }) : _tabController = tabController;

  final TabController _tabController;
  final DashboardViewModel viewModel;

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

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _requestUserPermissions();
  }

  Future<void> _showNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'Awesome Notification',
        body: 'This is an example notification.',
      ),
    );
  }

  Future<void> _requestUserPermissions() async {
    await AwesomeNotifications().requestPermissionToSendNotifications(
      channelKey: 'basic_channel',
    );
  }

  Future<void> _showScheduledNotification() async {
    // Bildirimi 5 saniye sonra gönder
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        channelKey: 'basic_channel',
        title: 'Scheduled Notification',
        body: 'This is a scheduled notification.',
      ),
      schedule: NotificationCalendar.fromDate(
        date: DateTime.now().add(const Duration(seconds: 5)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showScheduledNotification,
        child: const Icon(Icons.timer),
      ),
      appBar: AppBar(
        title: const Text('Awesome Notifications Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showNotification,
          child: const Text('Send Notification'),
        ),
      ),
    );
  }
}
*/