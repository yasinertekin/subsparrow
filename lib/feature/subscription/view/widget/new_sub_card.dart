part of '../subscription_view.dart';

final class _SubCard extends StatelessWidget {
  const _SubCard({
    required this.onTap,
    required this.sub,
  });

  final Subscription? sub;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: _SubCardImage(sub: sub),
        title: _SubCardTitle(sub: sub),
        trailing: const _SubCardIcon(),
      ),
    );
  }
}

final class _SubCardIcon extends StatelessWidget {
  const _SubCardIcon();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.add,
    );
  }
}

final class _SubCardTitle extends StatelessWidget {
  const _SubCardTitle({
    required this.sub,
  });

  final Subscription? sub;

  @override
  Widget build(BuildContext context) {
    return Text(
      sub?.subName ?? '',
    );
  }
}

final class _SubCardImage extends StatelessWidget {
  const _SubCardImage({
    required this.sub,
  });

  final Subscription? sub;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      sub?.subIcon ?? '',
      height: 50,
      width: 50,
    );
  }
}
