import 'package:flutter/material.dart';
import 'package:subsparrow/product/enum/tab_view.dart';

/// TabViews
extension TabIcons on TabViews {
  /// Icon
  IconData get icon {
    switch (this) {
      case TabViews.subscriptions:
        return Icons.subscriptions_outlined;
      case TabViews.payments:
        return Icons.payment;
      case TabViews.notifications:
        return Icons.notifications;
      case TabViews.profile:
        return Icons.person;
    }
  }
}
