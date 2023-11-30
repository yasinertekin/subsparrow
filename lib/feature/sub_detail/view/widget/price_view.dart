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
    return Padding(
      padding: context.padding.low,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Assets.icons.icPrice.svg(
            package: 'gen',
            height: context.sized.dynamicHeight(0.25),
          ),
          SizedBox(
            height: context.sized.dynamicHeight(0.5),
            child: _PriceList(
              subPrices: subPrices,
              subDetailNotifier: subDetailNotifier,
              pageController: pageController,
              subscription: subscription,
            ),
          ),
        ],
      ),
    );
  }
}

final class _PriceList extends StatelessWidget {
  const _PriceList({
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
    // Filter out items with empty values
    final filteredSubPrices = Map.fromEntries(
      subPrices!.entries.where((entry) => entry.value != ''),
    );

    return filteredSubPrices.isEmpty
        ? Column(
            children: [
              Center(
                child: Text(
                  'Aylık Tek Fiyat ${subscription.subBasePrice} ₺',
                  style: context.general.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    subDetailNotifier
                      ..setSelectedRadio(subscription.subBasePrice.toString())
                      ..selectPrice(subscription.subBasePrice.toString())
                      ..setSubViewEnum(pageController.page!.toInt() + 1);

                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Text('Devam et'),
                ),
              ),
            ],
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: filteredSubPrices.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListenableBuilder(
                      listenable: subDetailNotifier,
                      builder: (BuildContext context, Widget? child) {
                        return _PriceSelectCard(
                          subscription: subscription,
                          subPrices: filteredSubPrices,
                          subDetailNotifier: subDetailNotifier,
                          index: index,
                          pageController: pageController,
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    subDetailNotifier.setSubViewEnum(
                      pageController.page!.toInt() + 1,
                    );
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Text('Devam et'),
                ),
              ),
            ],
          );
  }
}

final class _PriceSelectCard extends StatelessWidget {
  const _PriceSelectCard({
    required this.subPrices,
    required this.subDetailNotifier,
    required this.index,
    required this.pageController,
    required this.subscription,
  });

  final Map<String, dynamic>? subPrices;
  final SubDetailNotifier subDetailNotifier;
  final int index;
  final PageController pageController;
  final Subscription subscription;

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
            ..setSubPlan(subPrices?.keys.elementAt(index) ?? '');
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
      toggleable: true,
      value: subPrices?.keys.elementAt(index) ?? '',
      groupValue: subDetailNotifier.character,
      onChanged: subDetailNotifier.setSelectedRadio,
    );
  }
}
