import 'package:flutter/material.dart';
import 'package:subsparrow/product/utility/enum/tab_view.dart';

/// TabViews
extension TabIcons on TabViews {
  /// Icon
  Widget get icon {
    switch (this) {
      case TabViews.aboneliklerim:
        return const Icon(Icons.subscriptions_outlined);

      case TabViews.abonelikEkle:
        return const Icon(
          Icons.add,
        );

      case TabViews.profil:
        return const Icon(Icons.person);
    }
  }
}
