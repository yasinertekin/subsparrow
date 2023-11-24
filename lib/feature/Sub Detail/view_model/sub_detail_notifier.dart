import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:subsparrow/product/model/subscription/subscription.dart';
import 'package:subsparrow/product/service/firebase_service.dart';

/// SubDetailNotifier
final class SubDetailNotifier extends ChangeNotifier {
  /// SubDetailNotifier constructor
  SubDetailNotifier() {
    selectedDate = DateTime.now();
    oneMonthLater = selectedDate.add(const Duration(days: 30));
  }

  final FirebaseServices _firebaseServices = FirebaseServices();
  final CollectionReference<Map<String, dynamic>> users = FirebaseFirestore.instance.collection('users');

  /// selectedDate
  late DateTime selectedDate;

  /// oneMonthLater
  late DateTime oneMonthLater;

  /// selectDate
  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      oneMonthLater = selectedDate.add(const Duration(days: 30));
      notifyListeners();
    }
  }

  /// addSub
  Future<void> addSub(
    String userId,
    Subscription? newSubDetail,
  ) {
    return _firebaseServices.addSubscriptionDetail(
      userId,
      newSubDetail,
      users,
    );
  }
}
