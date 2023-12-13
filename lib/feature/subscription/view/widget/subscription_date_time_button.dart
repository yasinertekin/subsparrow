part of '../subscription_view.dart';

final class _SubscriptionDateTimeButton extends StatelessWidget {
  const _SubscriptionDateTimeButton({
    required this.subViewModel,
    required this.subscriptionData,
  });

  final SubscriptionViewModel subViewModel;
  final SubscriptionData? subscriptionData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Column(
        children: [
          const Gap(15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await _selectDateAndNavigate(
                  context,
                );
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

  Future<void> _selectDateAndNavigate(BuildContext context) async {
    final currentContext = context;
    // Store the context outside async block
    final pickedDate = await subViewModel.selectDate(
      currentContext,
    );

    if (pickedDate != null) {
      subViewModel
        ..selectedDate = pickedDate
        ..monthCount = pickedDate.add(
          const Duration(days: 30),
        );

      await currentContext.route.navigateToPage(
        SubscriptionDetailView(
          subscriptionData: subscriptionData,
          subscriptionViewModel: subViewModel,
        ),
      );
    }
  }
}
