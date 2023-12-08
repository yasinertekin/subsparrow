import 'package:flutter/material.dart';
import 'package:gen/src/model/subscription_data/subscription_data.dart';
import 'package:subsparrow/feature/subscription/view/subscription_view.dart';
import 'package:subsparrow/feature/subscription/view_model/subscription_view_model.dart';

/// NewSub
mixin SubscriptionMixin on State<SubscriptionView> {
  final SubscriptionViewModel _subscriptionViewModel = SubscriptionViewModel();

  /// SubscriptionViewModel
  SubscriptionViewModel get subscriptionViewModel => _subscriptionViewModel;

  /// Add Subscription
  Future<List<SubscriptionData>> getSubscriptionData() async {
    final data = await subscriptionViewModel.getSubscriptionData();

    return data;
  }
}
