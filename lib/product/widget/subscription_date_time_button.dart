import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gen/src/model/subscription_data/subscription_data.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/subscription%20detail/view/subscription_detail_view.dart';
import 'package:subsparrow/feature/subscription/view_model/subscription_view_model.dart';

final class SubscriptionDateTimeButton extends StatelessWidget {
  const SubscriptionDateTimeButton({
    required this.subViewModel,
    required this.subscriptionData,
    super.key,
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
