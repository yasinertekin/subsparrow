import 'package:flutter/material.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:subsparrow/feature/search/view/search_view.dart';
import 'package:subsparrow/feature/search/view_model/search_view_model.dart';

/// [SearchViewMixin] is a mixin class for [SearchView].
mixin SearchViewMixin on State<SearchView> {
  /// [subList] is a list of subscriptions.
  List<Subscriptions> subList = [];

  /// [searchViewModel] is a view model for [SearchView].
  late final SearchViewModel searchViewModel;

  @override
  void initState() {
    super.initState();
    subList = widget.subscriptions;
    searchViewModel = SearchViewModel(
      subscriptions: subList,
    );
  }

  /// [filterList] is a function that filters the list of subscriptions.
  void filterList(
    String query,
  ) {
    searchViewModel.filterList(query);
  }
}
