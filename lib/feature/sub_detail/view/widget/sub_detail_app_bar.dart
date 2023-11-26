part of '../sub_detail_view.dart';

final class _SubDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _SubDetailAppBar({
    required this.subDetailNotifier,
  });

  final SubDetailNotifier subDetailNotifier;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: ListenableBuilder(
        listenable: subDetailNotifier,
        builder: (BuildContext context, Widget? child) => Text(
          subDetailNotifier.subViewEnum == SubViewEnum.date
              ? 'Aboneliğin Başlangıç Tarihi'
              : subDetailNotifier.subViewEnum == SubViewEnum.monthLength
                  ? 'Abonelik Süresi'
                  : subDetailNotifier.subViewEnum == SubViewEnum.subPrice
                      ? 'Abonelik Planınız'
                      : 'Genel Görünüm',
          style: context.general.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
