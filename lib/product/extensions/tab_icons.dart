import 'package:flutter/material.dart';
import 'package:subsparrow/product/enum/tab_view.dart';

/// TabViews
extension TabIcons on TabViews {
  /// Icon
  IconData get icon {
    switch (this) {
      case TabViews.home:
        return Icons.home;
      case TabViews.chat:
        return Icons.chat;
      case TabViews.calendar:
        return Icons.calendar_month_rounded;
      case TabViews.notification:
        return Icons.notifications;
    }
  }
}
