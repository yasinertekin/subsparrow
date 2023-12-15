import 'package:flutter/material.dart';
import 'package:gen/src/model/subscription_data/subscription_data.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/home/view/widget/home%20subscription%20cards/home_subscription_cards.dart';
import 'package:subsparrow/feature/home/view_model/home_view_model.dart';
import 'package:subsparrow/feature/search/view/mixin/search_view_mixin.dart';
import 'package:subsparrow/feature/search/view_model/search_view_model.dart';
import 'package:subsparrow/feature/subscription/view_model/subscription_view_model.dart';
import 'package:subsparrow/product/service/firebase_service.dart';
import 'package:subsparrow/product/widget/custom_search_text_field.dart';
import 'package:subsparrow/product/widget/subscription_view_card.dart';

part './widget/custom_text_field.dart';
part './widget/search_list.dart';
part './widget/search_view_app_bar.dart';

/// [SearchView] is a view for searching subscriptions.
final class SearchView extends StatefulWidget {
  /// [SearchView] is a view for searching subscriptions.
  const SearchView({
    this.subscriptions,
    this.firebaseService,
    this.homeViewModel,
    this.subscriptionData,
    this.subscriptionViewModel,
    super.key,
  });

  @override
  State<SearchView> createState() => _SearchViewState();

  /// [Subscriptions] list
  final List<Subscriptions>? subscriptions;

  /// [FirebaseService] instance
  final FirebaseService? firebaseService;

  /// [HomeViewModel] instance
  final HomeViewModel? homeViewModel;

  /// [SubscriptionData] list
  final List<SubscriptionData>? subscriptionData;

  /// [SubscriptionViewModel] instance
  final SubscriptionViewModel? subscriptionViewModel;
}

final class _SearchViewState extends State<SearchView> with SearchViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _SearchViewAppBar(),
      body: Column(
        children: [
          CustomSearchTextField(
            autofocus: true,
            onTap: () {},
            onChanged: searchViewModel.filterList,
          ),
          _SearchList(
            searchViewModel: searchViewModel,
            widget: widget,
            subscriptionViewModel: widget.subscriptionViewModel,
          ),
        ],
      ),
    );
  }
}
