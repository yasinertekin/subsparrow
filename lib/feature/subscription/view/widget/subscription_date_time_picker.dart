part of '../subscription_view.dart';

final class _SubscriptionDateTimePicker extends StatelessWidget {
  const _SubscriptionDateTimePicker({
    required this.subViewModel,
    required this.subDetail,
    required this.subscriptionData,
  });
  final SubscriptionViewModel subViewModel;
  final Subscriptions? subDetail;
  final SubscriptionData? subscriptionData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Assets.icons.icDatePicker.svg(
          package: 'gen',
          height: context.sized.dynamicHeight(0.35),
        ),
        _SubscriptionDateTimeButton(
          subscriptionData: subscriptionData,
          subViewModel: subViewModel,
        ),
      ],
    );
  }
}
