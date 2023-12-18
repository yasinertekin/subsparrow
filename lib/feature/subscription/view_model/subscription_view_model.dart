import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/subscription_data/subscription_data.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';

/// SubscriptionViewModel
final class SubscriptionViewModel extends ChangeNotifier {
  /// SubscriptionViewModel constructor
  SubscriptionViewModel() {
    selectedDate = DateTime.now();
    monthCount = selectedDate.add(
      const Duration(days: 30),
    );
  }

  List<SubscriptionData> _subscriptionData = [];

  /// subscriptionData
  List<SubscriptionData> get subscriptionData => _subscriptionData;

  /// subscriptionList
  List<Subscriptions> subscriptionList = [];

  /// selectedDate
  late DateTime selectedDate;

  /// oneMonthLater
  late DateTime monthCount;

  /// selectDate
  Future<DateTime?> selectDate(BuildContext context) async {
    const firstDate = 2000;
    const lastDate = 2101;
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(firstDate),
      lastDate: DateTime(lastDate),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
      return picked; // Return the picked date
    } else {
      return null; // Return null if the user cancels
    }
  }

  /// getSubscriptionData
  Future<List<SubscriptionData>> getSubscriptionData() async {
    if (_subscriptionData.isEmpty) {
      final subscriptions = FirebaseFirestore.instance.collection(
        'subscription_platforms',
      );
      final subscriptionDocs = await subscriptions.get();

      _subscriptionData = subscriptionDocs.docs
          .map(
            SubscriptionData.fromFirestore,
          )
          .toList();

      notifyListeners();
    }
    return _subscriptionData;
  }
}
