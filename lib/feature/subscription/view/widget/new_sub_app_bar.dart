part of '../subscription_view.dart';

final class _NewSubAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _NewSubAppBar();

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
