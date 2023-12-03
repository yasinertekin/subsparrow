part of '../view/subscription_detail_view.dart';

final class _SubscriptionDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SubscriptionDetailAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Abonelik Planları',
        style: context.general.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
