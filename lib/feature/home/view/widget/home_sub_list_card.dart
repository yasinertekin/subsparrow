part of '../home_view.dart';

final class _SubListCard extends StatelessWidget {
  const _SubListCard({required this.sub});

  final Subscription? sub;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SvgPicture.network(
          sub!.subIcon.toString(),
          height: 50,
        ),
        title: Text(
          sub?.subName?.toString() ?? '',
          style: context.general.textTheme.bodyLarge?.copyWith(),
        ),
        trailing: Text(
          '${sub?.subBasePrice} TL',
          style: context.general.textTheme.bodyMedium?.copyWith(),
        ),
      ),
    );
  }
}
