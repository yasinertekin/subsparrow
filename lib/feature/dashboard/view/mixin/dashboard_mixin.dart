import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:subsparrow/feature/dashboard/view/dashboard_view.dart';
import 'package:subsparrow/product/enum/tab_view.dart';
import 'package:subsparrow/product/extensions/tab_icons.dart';

/// DashBoardMixin
mixin DashBoardMixin on State<DashboardView> implements TickerProvider {
  late final TabController _tabController;

  /// tabController
  TabController get tabController => _tabController;

  /// tabViewsList
  late final List<Tab> _tabViewsList = TabViews.values
      .map(
        (e) => Tab(
          text: formatEnumName(
            e.name,
          ),
          icon: e.icon,
        ),
      )
      .toList();

  /// tabViewsList
  List<Tab> get tabViews => _tabViewsList;

  @override
  void initState() {
    super.initState();
    _initTabController(TabViews.values.length, this);
  }

  @override
  void dispose() {
    _disposeTabController();
    super.dispose();
  }

  void _initTabController(int length, TickerProvider vsync) {
    _tabController = TabController(
      length: length,
      vsync: vsync,
    );
  }

  void _disposeTabController() {
    _tabController.dispose();
  }

  /// Formats enum name to a more readable format
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

  /// FirebaseServices
  Future<void> addUser(
    String documentId,
    List<Subscriptions> subDetails,
    CollectionReference<Object?> users,
  ) async {
    try {
      final docRef = await users.doc(documentId).set({
        'subscriptionDetails': subDetails,
      });

      return docRef;
    } catch (e) {
      // Handle the error
    }
  }
}
