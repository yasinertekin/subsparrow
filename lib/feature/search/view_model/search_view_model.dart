import 'package:flutter/material.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';

/// [SearchViewModel] is a view model for [SearchView].
final class SearchViewModel extends ChangeNotifier {
  /// [SearchViewModel]  constructor.
  SearchViewModel({required this.subscriptions});

  /// [subscriptions] is a list of subscriptions.
  final List<Subscriptions> subscriptions;

  /// [filteredItems] is a list of filtered subscriptions.
  List<Subscriptions> filteredItems = [];

  /// [filterList] is a function that filters the list of subscriptions.
  void filterList(String query) {
    filteredItems.clear();
    if (query.isNotEmpty) {
      for (var i = 0; i < subscriptions.length; i++) {
        if (subscriptions[i].platformName!.toLowerCase().contains(
              query.toLowerCase(),
            )) {
          filteredItems.add(
            subscriptions[i],
          );
        }
      }
    }
    notifyListeners();
  }
}
