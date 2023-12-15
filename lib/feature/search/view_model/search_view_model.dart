import 'package:flutter/material.dart';
import 'package:gen/src/model/subscription_data/subscription_data.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';

class SearchViewModel extends ChangeNotifier {
  SearchViewModel({
    required this.subscriptionData,
    required this.subscriptions,
  });

  final List<SubscriptionData> subscriptionData;
  final List<Subscriptions> subscriptions;

  final List<SubscriptionData> subscriptionsFiltered = [];

  final List<Subscriptions> filteredItems = [];

  void _filterList(String query) {
    filteredItems.clear();
    subscriptionsFiltered.clear();

    // Tip kontrolü yaparak subscriptionData listesini filtrele
    if (subscriptionData.isNotEmpty) {
      for (final data in subscriptionData) {
        if (data.id.toLowerCase().contains(query.toLowerCase())) {
          subscriptionsFiltered.add(data);
        }
      }
    }

    // Tip kontrolü yaparak subscriptions listesini filtrele
    if (subscriptions.isNotEmpty) {
      for (final sub in subscriptions) {
        if (sub.platformName!.toLowerCase().contains(query.toLowerCase())) {
          filteredItems.add(sub);
        }
      }
    }

    notifyListeners();
  }

  // Dışarıdan çağrılacak olan genel filterList metodu
  void filterList(String query) {
    _filterList(query);
  }
}
