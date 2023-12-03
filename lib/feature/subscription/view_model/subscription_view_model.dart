import 'package:flutter/material.dart';

/// SubscriptionViewModel
final class SubscriptionViewModel extends ChangeNotifier {
  /// SubscriptionViewModel constructor
  SubscriptionViewModel() {
    selectedDate = DateTime.now();
    monthCount = selectedDate.add(
      const Duration(days: 30),
    );
  }

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
}
