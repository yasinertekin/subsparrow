import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/subscription_data/subscription_data.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/subscription/view_model/subscription_view_model.dart';
import 'package:subsparrow/product/widget/circle_loading.dart';
import 'package:subsparrow/product/widget/subscription_date_time_picker.dart';

/// SubscriptionViewCard widget
final class SubscriptionViewCard extends StatelessWidget {
  /// SubscriptionViewCard widget
  const SubscriptionViewCard({
    required this.subscriptionData,
    required this.index,
    required this.subscriptionViewModel,
    super.key,
  });

  /// [SubscriptionData] list
  final List<SubscriptionData> subscriptionData;

  /// [SubscriptionViewModel] instance
  final int index;

  /// [SubscriptionViewModel] instance
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
          SubscriptionDateTimePicker(
            subViewModel: subscriptionViewModel,
            subDetail: subscriptionData[index].data.subscriptions,
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
        size: Size(
          context.sized.dynamicWidth(0.1),
          context.sized.dynamicWidth(0.1),
        ),
        emptyWidget: const Icon(Icons.error),
        loadingWidget: const CircleLoading(),
        imageUrl: subscriptionData[index].data.subIcon,
      ),
    );
  }
}
