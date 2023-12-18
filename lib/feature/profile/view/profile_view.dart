import 'package:flutter/material.dart';
import 'package:subsparrow/feature/profile/view/mixin/profile_mixin.dart';
import 'package:subsparrow/product/utility/enum/profile_enum.dart';
import 'package:subsparrow/product/utility/extensions/profile_extensions.dart';

/// The main profile view widget.
final class ProfileView extends StatefulWidget {
  /// [ProfileView] default constructor
  const ProfileView({super.key});
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

final class _ProfileViewState extends State<ProfileView> with ProfileMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ProfileEnum.values.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProfileEnum.values[index].getProfileListTileTitle(
                    context: context,
                    viewModel: viewModel,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
