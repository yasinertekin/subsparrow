part of '../home_view.dart';

final class _HomeSearch extends StatelessWidget {
  const _HomeSearch();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Card(
        elevation: 3,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Abanoliklerimde Ara',
            prefixIcon: const Icon(
              Icons.search,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
