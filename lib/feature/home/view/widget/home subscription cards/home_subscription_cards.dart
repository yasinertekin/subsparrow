part of '../../home_view.dart';

/// SubscriptionCards is the main view of the application.
final class SubscriptionCards extends StatefulWidget {
  /// SubscriptionCards is the main view of the application.
  const SubscriptionCards({
    required this.item,
    super.key,
  });

  /// [Subscriptions] item
  final Subscriptions? item;

  @override
  SubscriptionCardsState createState() => SubscriptionCardsState();
}

/// [SubscriptionCards] is the main view of the application.
class SubscriptionCardsState extends State<SubscriptionCards> with HomeSubscriptionCardsMixin {
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
        return customAlertDialog(context);
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
        leading: Image.network(
          icon ?? '',
          width: 50,
          height: 50,
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
