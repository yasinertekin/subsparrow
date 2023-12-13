import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/subscription_data/subscription_data.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/dashboard/view/dashboard_view.dart';
import 'package:subsparrow/feature/subscription/view_model/subscription_view_model.dart';
import 'package:subsparrow/product/service/firebase_service.dart';
import 'package:widgets/src/widgets/custom_scaffold_messenger.dart';

part 'widget/subscription_date_time_title.dart';
part 'widget/subscription_detail_app_bar.dart';
part 'widget/subscription_detail_card.dart';

/// [SubscriptionDetailView] is the view that displays the
final class SubscriptionDetailView extends StatelessWidget {
  /// [SubscriptionDetailView] is the view that displays the
  const SubscriptionDetailView({
    required this.subscriptionData,
    required this.subscriptionViewModel,
    super.key,
  });

  /// [SubscriptionDetailView] is the view that displays the
  /// list of subscriptions
  final SubscriptionData? subscriptionData;

  /// [SubscriptionDetailView] is the view that displays the
  /// list of subscriptions
  final SubscriptionViewModel subscriptionViewModel;

  @override
  Widget build(BuildContext context) {
    final users = FirebaseFirestore.instance.collection('users');
    final firebaseServices = FirebaseServices();

    return Scaffold(
      appBar: const _SubscriptionDetailAppBar(),
      body: SubscriptionDetailList(
        subscriptionData: subscriptionData,
        firebaseServices: firebaseServices,
        subscriptionViewModel: subscriptionViewModel,
        users: users,
      ),
    );
  }
}

/// [SubscriptionDetailList] is the view that displays the
final class SubscriptionDetailList extends StatelessWidget {
  /// Constructs a [SubscriptionDetailList] widget.
  const SubscriptionDetailList({
    required this.subscriptionData,
    required this.firebaseServices,
    required this.subscriptionViewModel,
    required this.users,
    super.key,
  });

  /// [SubscriptionData] is the data for subscriptions.
  final SubscriptionData? subscriptionData;

  /// [FirebaseServices] is the services related to Firebase.
  final FirebaseServices firebaseServices;

  /// [SubscriptionViewModel] is the view model for subscriptions.
  final SubscriptionViewModel subscriptionViewModel;

  /// [users] is the collection reference for user data.
  final CollectionReference<Map<String, dynamic>> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subscriptionData!.data.subscriptions!.length,
      itemBuilder: (context, index) {
        return _SubscriptionDetailCard(
          index: index,
          firebaseServices: firebaseServices,
          subscriptionData: subscriptionData,
          subscriptionViewModel: subscriptionViewModel,
          users: users,
        );
      },
    );
  }
}
