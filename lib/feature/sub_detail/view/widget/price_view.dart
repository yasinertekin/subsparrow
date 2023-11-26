part of '../sub_detail_view.dart';

final class _PriceView extends StatelessWidget {
  const _PriceView({
    required this.subPrices,
    required this.subDetailNotifier,
    required this.pageController,
  });

  final Map<String, dynamic>? subPrices;
  final SubDetailNotifier subDetailNotifier;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: subPrices!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListenableBuilder(
                listenable: subDetailNotifier,
                builder: (BuildContext context, Widget? child) {
                  return ListTile(
                    onTap: () {
                      subDetailNotifier
                        ..setSelectedRadio(subPrices?.keys.elementAt(index))
                        ..selectPrice(
                          subPrices?.values.elementAt(index).toString(),
                        );
                      subDetailNotifier.setSubViewEnum(
                        pageController.page!.toInt() + 1,
                      );
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    title: Text('${subPrices?.keys.elementAt(index)} ₺'),
                    leading: Radio<String>(
                      value: subPrices?.keys.elementAt(index) ?? '',
                      groupValue: subDetailNotifier.character,
                      onChanged: subDetailNotifier.setSelectedRadio,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

final class _SaveButton extends StatelessWidget {
  const _SaveButton({
    required this.index,
    required this.subDetailNotifier,
    required this.subPrices,
  });
  final int index;
  final SubDetailNotifier subDetailNotifier;
  final Map<String, dynamic>? subPrices;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        subDetailNotifier.selectPrice(subPrices?.values.elementAt(index).toString());
      },
      child: const Text('Kaydet'),
    );
  }
}
