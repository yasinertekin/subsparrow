part of '../new_sub_view.dart';

final class _NewSubAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _NewSubAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        'Abonelikler',
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
