part of '../search_view.dart';

final class _SearchList extends StatelessWidget {
  const _SearchList({
    required this.searchViewModel,
    required this.widget,
  });

  final SearchViewModel searchViewModel;
  final SearchView widget;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
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
    );
  }
}
