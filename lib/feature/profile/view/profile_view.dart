import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:subsparrow/feature/profile/view/mixin/profile_mixin.dart';
import 'package:subsparrow/feature/profile/view_model/profile_view_model.dart';

part 'widget/user_name_text_field.dart';

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
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              child: ClipOval(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  viewModel.firebaseUser?.photoURL ?? 'https://picsum.photos/200',
                  width: context.sized.dynamicWidth(0.5),
                  height: context.sized.dynamicHeight(0.25),
                ),
              ),
            ),
            _CustomTextField(
              viewModel: viewModel,
              textEditingController: viewModel.displayNameController,
              textFieldTitle: 'Display Name',
              icon: const Icon(
                Icons.person,
              ),
              onPressed: () => changeNameFunction(viewModel, context),
            ),

            /*    _CustomTextField(
              viewModel: viewModel,
              textEditingController: viewModel.emailController,
              textFieldTitle: 'Email',
              icon: const Icon(
                Icons.email,
              ),
              onPressed: () => changeEmailFunction(viewModel, context),
            ),*/
          ],
        ),
      ),
    );
  }
}
