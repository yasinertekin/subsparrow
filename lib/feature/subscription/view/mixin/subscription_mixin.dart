import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/subscription_data/subscription_data.dart';
import 'package:subsparrow/feature/subscription/view/subscription_view.dart';

/// NewSub
mixin SubscriptionMixin on State<SubscriptionView> {
  /// users
  final CollectionReference<Map<String, dynamic>> users = FirebaseFirestore.instance.collection('users');

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Add Subscription
  Future<List<SubscriptionData>> getSubscriptionData() async {
    final CollectionReference subscriptions = _firestore.collection('subscription_platforms');
    final subscriptionDocs = await subscriptions.get();

    return subscriptionDocs.docs.map(SubscriptionData.fromFirestore).toList();
  }
}
