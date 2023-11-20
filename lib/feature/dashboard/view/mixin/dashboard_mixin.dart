import 'package:flutter/material.dart';
import 'package:subsparrow/feature/dashboard/view/dashboard_view.dart';
import 'package:subsparrow/product/enum/tab_view.dart';

mixin DashBoardMixin on State<DashboardView> implements TickerProvider {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    initTabController(TabViews.values.length, this);
  }

  @override
  void dispose() {
    disposeTabController();
    super.dispose();
  }

  void initTabController(int length, TickerProvider vsync) {
    tabController = TabController(
      length: length,
      vsync: vsync,
    );
  }

  void disposeTabController() {
    tabController.dispose();
  }

  String formatEnumName(String value) {
    final name = value;
    var formattedName = '';

    for (var i = 0; i < name.length; i++) {
      if (i == 0 || (i != 0 && name[i - 1] == '_')) {
        formattedName += name[i].toUpperCase();
      } else if (name[i] == name[i].toUpperCase()) {
        formattedName += ' ${name[i].toUpperCase()}';
      } else {
        formattedName += name[i].toLowerCase();
      }
    }

    return formattedName;
  }
}
