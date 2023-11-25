import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:subsparrow/product/model/subscription/subscription.dart';
import 'package:subsparrow/product/service/firebase_service.dart';

/// SubDetailNotifier
final class SubDetailNotifier extends ChangeNotifier {
  /// SubDetailNotifier constructor
  SubDetailNotifier() {
    selectedDate = DateTime.now();
    //  oneMonthLater = selectedDate.add(const Duration(days: days));
  }

  final FirebaseServices _firebaseServices = FirebaseServices();
  final CollectionReference<Map<String, dynamic>> users = FirebaseFirestore.instance.collection('users');

  /// selectedDate
  late DateTime selectedDate;

  /// oneMonthLater
  late DateTime oneMonthLater;

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
