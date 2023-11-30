part of '../sub_detail_view.dart';

final class _SubMonthList extends StatelessWidget {
  const _SubMonthList({
    required this.subDetailNotifier,
    required this.pageController,
    required this.subscription,
  });

  final SubDetailNotifier subDetailNotifier;
  final PageController pageController;
  final Subscription subscription;

  String _formatEnumName(SubLength enumValue) {
    final enumName = enumValue.toString().split('.').last;
    final words = enumName.split(RegExp('(?=[A-Z])'));

    for (var i = 0; i < words.length; i++) {
      words[i] = words[i][0].toUpperCase() + words[i].substring(1);
    }

    return words.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return subscription.subMonth == true
        ? _subscriptionList()
        : _SubOneMonthPrice(
            subscription: subscription,
            subDetailNotifier: subDetailNotifier,
            pageController: pageController,
          );
  }

  ListView _subscriptionList() {
    return ListView.builder(
      itemCount: SubLength.values.length,
      itemBuilder: (BuildContext context, int index) {
        final currentSubLength = SubLength.values[index];

        return ListTile(
          title: Text(
            _formatEnumName(currentSubLength),
          ),
          onTap: () async {
            subDetailNotifier
              ..monthCount = subDetailNotifier.selectedDate.add(
                Duration(
                  days: getSubscriptionDays(currentSubLength),
                ),
              )
              ..setSubViewEnum(pageController.page!.toInt() + 1);

            await pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        );
      },
    );
  }
}

final class _SubOneMonthPrice extends StatelessWidget {
  const _SubOneMonthPrice({
    required this.subscription,
    required this.subDetailNotifier,
    required this.pageController,
  });

  final Subscription subscription;
  final SubDetailNotifier subDetailNotifier;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Assets.icons.icCreditCard.svg(
            package: 'gen',
          ),
          const Gap(15),
          Text(
            '${subscription.subName} aylık üyelikleri desteklemektedir.',
            style: context.general.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(15),
          ElevatedButton(
            onPressed: () {
              subDetailNotifier
                ..monthCount = subDetailNotifier.selectedDate.add(
                  const Duration(days: 30),
                )
                ..setSubViewEnum(pageController.page!.toInt() + 1);

              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: const Text('Devam Et'),
          ),
        ],
      ),
    );
  }
}
