part of '../home_view.dart';

final class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: ClipRRect(
        borderRadius: context.border.lowBorderRadius,
        child: Assets.images.imgSubLogoTwo.image(
          package: 'gen',
        ),
      ),
      title: const Text(
        'Hoş Geldiniz',
      ),
      actions: const [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
