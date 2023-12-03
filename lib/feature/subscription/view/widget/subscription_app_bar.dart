part of '../subscription_view.dart';

final class _SubsriptionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SubsriptionAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Abonelikler',
        style: context.general.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
