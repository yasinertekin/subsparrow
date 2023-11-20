import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:subsparrow/feature/home/view/home_view.dart';
import 'package:subsparrow/product/model/subscriptions.dart';
import 'package:subsparrow/product/service/firebase_service.dart';

/// HomeViewMixin
mixin HomeViewMixin on State<HomeView> {
  final CollectionReference<Map<String, dynamic>> subscriptions =
      FirebaseFirestore.instance.collection('subscriptions');
  final FirebaseServices _firebaseServices = FirebaseServices();

  Future<QuerySnapshot<SubscriptionCollection?>> getSubData() {
    return _firebaseServices.getSubscriptions(subscriptions);
  }
}
