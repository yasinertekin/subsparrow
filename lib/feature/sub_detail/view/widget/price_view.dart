part of '../sub_detail_view.dart';

final class _PriceView extends StatelessWidget {
  const _PriceView({
    required this.subPrices,
    required this.subDetailNotifier,
    required this.pageController,
    required this.subscription,
  });

  final Map<String, dynamic>? subPrices;
  final SubDetailNotifier subDetailNotifier;
  final PageController pageController;
  final Subscription subscription;
  @override
  Widget build(BuildContext context) {
    if (subscription.subOnePrice == true) {
      /// ToDo: Add your logic here

      // Perform page transition
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      // Return an empty container or any other widget if needed
      return const SizedBox.shrink();
    } else {
      // Display your normal content with _PriceList
      return Column(
        children: <Widget>[
          Expanded(
            child: _PriceList(
              subPrices: subPrices,
              subDetailNotifier: subDetailNotifier,
              pageController: pageController,
            ),
          ),
        ],
      );
    }
  }
}

final class _PriceList extends StatelessWidget {
  const _PriceList({
    required this.subPrices,
    required this.subDetailNotifier,
    required this.pageController,
  });

  final Map<String, dynamic>? subPrices;
  final SubDetailNotifier subDetailNotifier;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subPrices!.length,
      itemBuilder: (BuildContext context, int index) {
        return ListenableBuilder(
          listenable: subDetailNotifier,
          builder: (BuildContext context, Widget? child) {
            return _PriceSelectCard(
              subPrices: subPrices,
              subDetailNotifier: subDetailNotifier,
              index: index,
              pageController: pageController,
            );
          },
        );
      },
    );
  }
}

final class _PriceSelectCard extends StatelessWidget {
  const _PriceSelectCard({
    required this.subPrices,
    required this.subDetailNotifier,
    required this.index,
    required this.pageController,
  });

  final Map<String, dynamic>? subPrices;
  final SubDetailNotifier subDetailNotifier;
  final int index;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          subDetailNotifier
            ..setSelectedRadio(subPrices?.keys.elementAt(index))
            ..selectPrice(
              subPrices?.values.elementAt(index).toString(),
            )
            ..setSubViewEnum(pageController.page!.toInt() + 1);

          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
        title: Text('${subPrices?.keys.elementAt(index)} ₺'),
        leading: _RadioButton(
          subPrices: subPrices,
          index: index,
          subDetailNotifier: subDetailNotifier,
        ),
        trailing: Text('${subPrices?.values.elementAt(index)} ₺'),
      ),
    );
  }
}

final class _RadioButton extends StatelessWidget {
  const _RadioButton({
    required this.subPrices,
    required this.subDetailNotifier,
    required this.index,
  });

  final Map<String, dynamic>? subPrices;
  final SubDetailNotifier subDetailNotifier;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Radio<String>(
      value: subPrices?.keys.elementAt(index) ?? '',
      groupValue: subDetailNotifier.character,
      onChanged: subDetailNotifier.setSelectedRadio,
    );
  }
}
