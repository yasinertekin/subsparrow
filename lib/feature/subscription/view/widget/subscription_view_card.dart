part of '../subscription_view.dart';

final class _SubscriptionViewCard extends StatelessWidget {
  const _SubscriptionViewCard({
    required this.subscriptionData,
    required this.index,
    required this.subscriptionViewModel,
  });

  final List<SubscriptionData> subscriptionData;
  final int index;
  final SubscriptionViewModel subscriptionViewModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.route.navigateToPage(
            _SubscriptionDateTimePicker(
              subViewModel: subscriptionViewModel,
              subDetail: subscriptionData[index].data.subscriptions?[index],
              subscriptionData: subscriptionData[index],
            ),
          );
        },
        title: CustomNetworkImage(
          boxFit: BoxFit.contain,
          size: const Size(
            50,
            50,
          ),
          emptyWidget: const Icon(Icons.error),
          loadingWidget: const CircularProgressIndicator(),
          imageUrl: subscriptionData[index].data.subscriptions?[index].icon,
        ),
        subtitle: Text(
          subscriptionData[index].id.toString(),
          style: context.general.textTheme.bodyLarge?.copyWith(),
        ),
      ),
    );
  }
}

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
        _DateTimeButton(
          subscriptionData: subscriptionData,
          subViewModel: subViewModel,
        ),
      ],
    );
  }
}

final class _DateTimeButton extends StatelessWidget {
  const _DateTimeButton({
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
                final pickedDate = await subViewModel.selectDate(
                  context,
                );
                if (pickedDate != null) {
                  subViewModel.selectedDate = pickedDate;
                  subViewModel.monthCount = pickedDate.add(
                    const Duration(days: 30),
                  );
                  await context.route.navigateToPage(
                    SubscriptionDetailView(
                      subscriptionData: subscriptionData,
                      subscriptionViewModel: subViewModel,
                    ),
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

// ignore: unused_element
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
