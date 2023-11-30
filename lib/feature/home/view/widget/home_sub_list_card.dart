part of '../home_view.dart';

final class _SubListCard extends StatelessWidget {
  const _SubListCard({required this.sub});

  final Subscription? sub;

  @override
  Widget build(BuildContext context) {
    const height = 50.0;
    return Dismissible(
      key: ValueKey(sub?.subName),
      onDismissed: (direction) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${sub?.subName} silindi'),
            action: SnackBarAction(
              label: StringConstants.getBack,
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          ),
        );
      },
      child: Card(
        child: ListTile(
          leading: SvgPicture.network(
            sub!.subIcon.toString(),
            height: height,
          ),
          title: Text(
            sub?.subName?.toString() ?? '',
            style: context.general.textTheme.bodyLarge?.copyWith(),
          ),
          trailing: Text(
            '${sub?.subBasePrice} TL',
            style: context.general.textTheme.bodyMedium?.copyWith(),
          ),
          subtitle: Text(
            '${sub?.subType} ay',
            style: context.general.textTheme.bodyMedium?.copyWith(),
          ),
        ),
      ),
    );
  }
}
