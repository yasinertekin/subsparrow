part of '../search_view.dart';

// ignore: lines_longer_than_80_chars
final class _SearchViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SearchViewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Abonelik Ara'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
