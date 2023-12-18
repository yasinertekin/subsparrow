import 'package:flutter/material.dart';

/// The profile list tile widget.
final class ProfileListTile extends StatelessWidget {
  /// [ProfileListTile] default constructor
  const ProfileListTile({
    required this.listTileTrailing,
    super.key,
    this.listTileTitle,
  });

  /// The [listTileTrailing] parameter is optional.
  final Widget listTileTrailing;

  final Widget? listTileTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: listTileTitle,
          trailing: listTileTrailing,
        ),
        const Divider(),
      ],
    );
  }
}
