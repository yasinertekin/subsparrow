part of '../sub_detail_view.dart';

final class _SubscriptionDateTimePicker extends StatelessWidget {
  const _SubscriptionDateTimePicker({
    required this.subView,
    required this.subDetailNotifier,
    required this.checkPickedDate,
    required this.subDetail,
    required this.pageController,
  });
  final SubViewEnum subView;
  final SubDetailNotifier subDetailNotifier;
  final void Function(DateTime pickedDate) checkPickedDate;
  final Subscription? subDetail;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const _DateTimeTitle(),
        Assets.icons.icDatePicker.svg(
          package: 'gen',
          height: context.sized.dynamicHeight(0.35),
        ),
        _DateTimeButton(
          subDetailNotifier: subDetailNotifier,
          pageController: pageController,
        ),
      ],
    );
  }
}

final class _DateTimeButton extends StatelessWidget {
  const _DateTimeButton({
    required this.subDetailNotifier,
    required this.pageController,
  });

  final SubDetailNotifier subDetailNotifier;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    const milliseconds = 300;
    return Padding(
      padding: context.padding.low,
      child: Column(
        children: [
          const Gap(15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final pickedDate = await subDetailNotifier.selectDate(
                  context,
                );
                if (pickedDate != null) {
                  await pageController.nextPage(
                    duration: const Duration(
                      milliseconds: milliseconds,
                    ),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: const Text(
                'Tarih Seç',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class _DateTimeTitle extends StatelessWidget {
  const _DateTimeTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Abonelik Başlangıç Tarihiniz',
          style: context.general.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
