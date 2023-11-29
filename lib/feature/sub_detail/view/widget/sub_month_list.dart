part of '../sub_detail_view.dart';

final class _SubMonthList extends StatelessWidget {
  const _SubMonthList({
    required this.subDetailNotifier,
    required this.pageController,
  });

  final SubDetailNotifier subDetailNotifier;
  final PageController pageController;

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
