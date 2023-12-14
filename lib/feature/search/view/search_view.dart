import 'package:flutter/material.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/home/view/widget/home%20subscription%20cards/home_subscription_cards.dart';
import 'package:subsparrow/feature/home/view_model/home_view_model.dart';
import 'package:subsparrow/feature/search/view/mixin/search_view_mixin.dart';
import 'package:subsparrow/feature/search/view_model/search_view_model.dart';
import 'package:subsparrow/product/service/firebase_service.dart';

part './widget/custom_text_field.dart';
part './widget/search_list.dart';
part './widget/search_view_app_bar.dart';

/// [SearchView] is a view for searching subscriptions.
final class SearchView extends StatefulWidget {
  /// [SearchView] is a view for searching subscriptions.
  const SearchView({
    required this.subscriptions,
    required this.firebaseService,
    required this.homeViewModel,
    super.key,
  });

  @override
  State<SearchView> createState() => _SearchViewState();

  /// [Subscriptions] list
  final List<Subscriptions> subscriptions;

  /// [FirebaseService] instance
  final FirebaseService firebaseService;

  /// [HomeViewModel] instance
  final HomeViewModel homeViewModel;
}

final class _SearchViewState extends State<SearchView> with SearchViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _SearchViewAppBar(),
      body: Column(
        children: [
          _CustomTextField(
            onChanged: filterList,
          ),
          _SearchList(
            searchViewModel: searchViewModel,
            widget: widget,
          ),
        ],
      ),
    );
  }
}
