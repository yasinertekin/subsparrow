import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/home/view/widget/home%20subscription%20cards/home_subscription_cards_mixin.dart';
import 'package:subsparrow/feature/home/view_model/home_view_model.dart';
import 'package:subsparrow/product/service/firebase_service.dart';

/// SubscriptionCards is the main view of the application.
final class SubscriptionCards extends StatefulWidget {
  /// SubscriptionCards is the main view of the application.
  const SubscriptionCards({
    required this.item,
    required this.firebaseService,
    this.homeViewModel,
    super.key,
  });

  /// [Subscriptions] item
  final Subscriptions? item;

  /// [FirebaseService] instance
  final FirebaseService? firebaseService;

  /// [HomeViewModel] instance
  final HomeViewModel? homeViewModel;

  @override
  SubscriptionCardsState createState() => SubscriptionCardsState();
}

// ignore: lines_longer_than_80_chars
/// [SubscriptionCards] is the main view of the application.
final class SubscriptionCardsState extends State<SubscriptionCards> with HomeSubscriptionCardsMixin {
  @override
  Widget build(BuildContext context) {
    final icon = widget.item?.icon;
    final name = widget.item?.name;
    final platformName = widget.item?.platformName;
    final price = widget.item?.price;

    return Dismissible(
      key: Key(widget.item?.name ?? ''),
      onDismissed: (_) {},
      background: const _CustomDismissibleBackground(),
      confirmDismiss: (_) async {
        return showCustomDialog(
          context,
          widget.firebaseService!,
          widget.item!,
        );
      },
      resizeDuration: const Duration(milliseconds: 200),
      direction: DismissDirection.endToStart,
      onResize: () {},
      child: _CustomCard(
        icon: icon,
        platformName: platformName,
        name: name,
        price: price,
      ),
    );
  }
}

final class _CustomCard extends StatelessWidget {
  const _CustomCard({
    required this.icon,
    required this.platformName,
    required this.name,
    required this.price,
  });

  final String? icon;
  final String? platformName;
  final String? name;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: ListTile(
        leading: CustomNetworkImage(
          imageUrl: icon,
          size: Size(
            context.sized.dynamicWidth(0.1),
            context.sized.dynamicWidth(0.1),
          ),
        ),
        title: Text(platformName ?? ''),
        subtitle: Text(name ?? ''),
        trailing: Text(
          '$price ₺',
          style: context.general.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

final class _CustomDismissibleBackground extends StatelessWidget {
  const _CustomDismissibleBackground();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
