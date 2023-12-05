part of '../home_view.dart';

final class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      /*  leading: ClipRRect(
        borderRadius: context.border.lowBorderRadius,
        child: Assets.icons.icAuth.svg(
          package: 'gen',
        ), 
      ),*/
      title: Text(
        StringConstants.mySubscriptions,
        style: context.general.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
