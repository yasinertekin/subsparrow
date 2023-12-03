part of '../home_view.dart';

final class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      /*  leading: ClipRRect(
        borderRadius: context.border.lowBorderRadius,
        child: Assets.icons.icAuth.svg(
          package: 'gen',
        ), 
      ),*/
      title: Text(
        'Aboneliklerim',
        style: context.general.textTheme.displaySmall?.copyWith(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
