import 'package:flutter/material.dart';
import 'package:gen/src/model/subscription_data/subscription_data.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';

/// [SearchViewModel] is the view model of the search view.
final class SearchViewModel extends ChangeNotifier {
  /// [SearchViewModel] is the view model of the search view.
  SearchViewModel({
    required this.subscriptionData,
    required this.subscriptions,
  });

  /// [subscriptionData] is the list of subscription data.
  final List<SubscriptionData> subscriptionData;

  /// [subscriptions] is the list of subscriptions.
  final List<Subscriptions> subscriptions;

  /// [subscriptionsFiltered] is the list of filtered subscriptions.
  final List<SubscriptionData> subscriptionsFiltered = [];

  /// [filteredItems] is the list of filtered subscriptions.
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

  /// [filterList] is the function that filters the list.
  void filterList(String query) {
    _filterList(query);
  }
}
