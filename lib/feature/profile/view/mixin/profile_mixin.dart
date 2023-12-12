import 'package:flutter/material.dart';
import 'package:subsparrow/feature/profile/view/profile_view.dart';
import 'package:subsparrow/feature/profile/view_model/profile_view_model.dart';
import 'package:widgets/src/widgets/custom_scaffold_messenger.dart';

/// The mixin for the [ProfileView].
mixin ProfileMixin on State<ProfileView> {
  /// The view model for the [ProfileView].
  final _viewModel = ProfileViewModel();

  /// The view model for the [ProfileView].
  ProfileViewModel get viewModel => _viewModel;

  /// Changes the email of the current user.
  void changeNameFunction(ProfileViewModel viewModel, BuildContext context) {
    viewModel.updateDisplayName();
    CustomSnackBar.show(
      context: context,
      content: Text('Yeni Kullanıcı Adınız: ${viewModel.userName}'),
    );
  }

  /// Changes the email of the current user.
  void changeEmailFunction(ProfileViewModel viewModel, BuildContext context) {
    viewModel.updateEmail();
    CustomSnackBar.show(
      context: context,
      content: Text('Yeni Email Adresiniz: ${viewModel.email}'),
    );
  }
}
