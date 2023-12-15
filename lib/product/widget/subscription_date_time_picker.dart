import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:gen/src/model/subscription_data/subscription_data.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/subscription/view_model/subscription_view_model.dart';
import 'package:subsparrow/product/widget/subscription_date_time_button.dart';

/// This is the subscription view card widget
final class SubscriptionDateTimePicker extends StatelessWidget {
  /// This is the subscription view card widget
  const SubscriptionDateTimePicker({
    required this.subViewModel,
    required this.subDetail,
    required this.subscriptionData,
    super.key,
  });

  /// [subViewModel] is a view model for [SubscriptionView].
  final SubscriptionViewModel subViewModel;

  /// [subDetail] is a subscription detail.
  final Subscriptions? subDetail;

  /// [subscriptionData] is a subscription data.
  final SubscriptionData? subscriptionData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Assets.icons.icDatePicker.svg(
            package: 'gen',
            height: context.sized.dynamicHeight(0.35),
          ),
          SubscriptionDateTimeButton(
            subscriptionData: subscriptionData,
            subViewModel: subViewModel,
          ),
        ],
      ),
    );
  }
}
