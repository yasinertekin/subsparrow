// ignore_for_file: use_build_context_synchronously

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
    return Padding(
      padding: context.padding.low,
      child: Card(
        elevation: 7,
        child: _CustomListTile(
          subscriptionViewModel: subscriptionViewModel,
          subscriptionData: subscriptionData,
          index: index,
        ),
      ),
    );
  }
}

final class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.subscriptionViewModel,
    required this.subscriptionData,
    required this.index,
  });

  final SubscriptionViewModel subscriptionViewModel;
  final List<SubscriptionData> subscriptionData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.route.navigateToPage(
          _SubscriptionDateTimePicker(
            subViewModel: subscriptionViewModel,
            subDetail: subscriptionData[index].data.subscriptions?[index],
            subscriptionData: subscriptionData[index],
          ),
        );
      },
      leading: _CustomListTileLeading(
        subscriptionData: subscriptionData,
        index: index,
      ),
      title: _CustomListTileTitle(
        subscriptionData: subscriptionData,
        index: index,
      ),
      trailing: const Icon(
        Icons.add,
      ),
    );
  }
}

final class _CustomListTileTitle extends StatelessWidget {
  const _CustomListTileTitle({
    required this.subscriptionData,
    required this.index,
  });

  final List<SubscriptionData> subscriptionData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      subscriptionData[index].id,
      style: context.general.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

final class _CustomListTileLeading extends StatelessWidget {
  const _CustomListTileLeading({
    required this.subscriptionData,
    required this.index,
  });

  final List<SubscriptionData> subscriptionData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: CustomNetworkImage(
        boxFit: BoxFit.contain,
        size: Size(
          context.sized.dynamicHeight(0.05),
          context.sized.dynamicHeight(0.10),
        ),
        emptyWidget: const Icon(Icons.error),
        loadingWidget: const CircularProgressIndicator(),
        imageUrl: subscriptionData[index].data.subscriptions?[index].icon,
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
