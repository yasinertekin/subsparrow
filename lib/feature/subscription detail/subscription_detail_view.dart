import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/subscription_data/subscription_data.dart';
import 'package:subsparrow/feature/subscription/view_model/subscription_view_model.dart';
import 'package:subsparrow/product/service/firebase_service.dart';

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
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: ListView.builder(
        itemCount: subscriptionData!.data.subscriptions!.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              firebaseServices.addSubscription(
                FirebaseAuth.instance.currentUser!.uid,
                subscriptionData!.data.subscriptions![index].copyWith(
                  startDate: subscriptionViewModel.selectedDate,
                  endDate: subscriptionViewModel.monthCount,
                  status: true,
                  icon: subscriptionData!.data.subscriptions![index].icon,
                  name: subscriptionData!.data.subscriptions![index].name,
                  price: subscriptionData!.data.subscriptions![index].price,
                  platformName: subscriptionData!.data.subscriptions![index].platformName,
                ),
                users,
              );
            },
            title: Text(subscriptionData!.data.subscriptions![index].name!),
            subtitle: Text(
              '${subscriptionData!.data.subscriptions![index].price!} ₺',
            ),
          );
        },
      ),
    );
  }
}
