part of '../register_view.dart';

final class _RegisterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _RegisterAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        "SubSparrow'a Hoşgeldiniz!",
        style: context.general.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
