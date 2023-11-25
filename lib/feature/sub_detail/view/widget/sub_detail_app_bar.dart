part of '../sub_detail_view.dart';

final class _SubDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SubDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Abonelik Detayları'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
