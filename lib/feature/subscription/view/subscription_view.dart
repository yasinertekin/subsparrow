import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gen/gen.dart';
import 'package:gen/src/model/subscription_data/subscription_data.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/subscription%20detail/view/subscription_detail_view.dart';
import 'package:subsparrow/feature/subscription/view/mixin/subscription_mixin.dart';
import 'package:subsparrow/feature/subscription/view_model/subscription_view_model.dart';

part 'widget/subscription_app_bar.dart';
part 'widget/subscription_date_time_button.dart';
part 'widget/subscription_date_time_picker.dart';
part 'widget/subscription_view_card.dart';

/// [SubscriptionView] is the view that displays the list of subscriptions
final class SubscriptionView extends StatefulWidget {
  /// [SubscriptionView] is the view that displays the list of subscriptions
  const SubscriptionView({super.key});

  @override
  _SubscriptionViewState createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> with SubscriptionMixin {
  /// [SubscriptionView] is the view that displays the list of subscriptions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _SubsriptionAppBar(),
      body: FutureBuilder(
        future: getSubscriptionData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final subscriptionData = snapshot.data!;
            return _SubscriptionList(
              subscriptionData: subscriptionData,
              subscriptionViewModel: subscriptionViewModel,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

final class _SubscriptionList extends StatelessWidget {
  const _SubscriptionList({
    required this.subscriptionData,
    required SubscriptionViewModel subscriptionViewModel,
  }) : _subscriptionViewModel = subscriptionViewModel;

  final List<SubscriptionData> subscriptionData;
  final SubscriptionViewModel _subscriptionViewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: subscriptionData.length,
        itemBuilder: (context, index) {
          return _SubscriptionViewCard(
            subscriptionData: subscriptionData,
            subscriptionViewModel: _subscriptionViewModel,
            index: index,
          );
        },
      ),
    );
  }
}
