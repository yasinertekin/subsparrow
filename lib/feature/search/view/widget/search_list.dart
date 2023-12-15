part of '../search_view.dart';

final class _SearchList extends StatelessWidget {
  const _SearchList({
    required this.searchViewModel,
    required this.widget,
    this.subscriptionViewModel,
  });

  final SearchViewModel searchViewModel;
  final SearchView widget;
  final SubscriptionViewModel? subscriptionViewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: searchViewModel,
      builder: (context, child) => Expanded(
        child: ListView.builder(
          itemCount: searchViewModel.subscriptionData.isNotEmpty
              ? searchViewModel.subscriptionsFiltered.length
              : searchViewModel.filteredItems.length,
          itemBuilder: (context, index) {
            return searchViewModel.subscriptionData.isEmpty
                ? SubscriptionCards(
                    item: searchViewModel.filteredItems[index],
                    firebaseService: widget.firebaseService,
                    homeViewModel: widget.homeViewModel,
                  )
                : SubscriptionViewCard(
                    subscriptionData: searchViewModel.subscriptionsFiltered,
                    index: index,
                    subscriptionViewModel: widget.subscriptionViewModel!,
                  );
          },
        ),
      ),
    );
  }
}
