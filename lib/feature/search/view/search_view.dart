import 'package:flutter/material.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/home/view/widget/home%20subscription%20cards/home_subscription_cards.dart';
import 'package:subsparrow/feature/home/view_model/home_view_model.dart';
import 'package:subsparrow/feature/search/view/mixin/search_view_mixin.dart';
import 'package:subsparrow/product/service/firebase_service.dart';

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

class _SearchViewState extends State<SearchView> with SearchViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abonelik Ara'),
      ),
      body: Column(
        children: [
          Padding(
            padding: context.padding.low,
            child: TextField(
              autofocus: true,
              onChanged: filterList,
              decoration: const InputDecoration(
                hintText: 'Aboneliklerimde Ara',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          ListenableBuilder(
            listenable: searchViewModel,
            builder: (context, child) => Expanded(
              child: ListView.builder(
                itemCount: searchViewModel.filteredItems.length,
                itemBuilder: (context, index) {
                  return SubscriptionCards(
                    item: searchViewModel.filteredItems[index],
                    firebaseService: widget.firebaseService,
                    homeViewModel: widget.homeViewModel,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
