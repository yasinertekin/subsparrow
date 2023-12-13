part of '../home_view.dart';

/// [_CustomCircleAvatar] is used to build the circle avatar.
final class _CustomCircleAvatar extends StatelessWidget {
  /// [_CustomCircleAvatar] is used to build the circle avatar.
  const _CustomCircleAvatar({
    required this.title,
    required this.value,
  });

  /// [title] is the title of the circle avatar.
  final String title;

  /// [value] is the value of the circle avatar.
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.general.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: CircleAvatar(
            radius: context.sized.dynamicHeight(0.042),
            child: Text(
              value,
            ),
          ),
        ),
      ],
    );
  }
}
