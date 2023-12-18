import 'package:flutter/material.dart';
import 'package:subsparrow/feature/profile/view_model/profile_view_model.dart';

/// The user name text field widget.
final class CustomProfileTextField extends StatelessWidget {
  /// [CustomProfileTextField] default constructor
  const CustomProfileTextField({
    required this.viewModel,
    required this.textEditingController,
    required this.onSubmitted,
    super.key,
  });

  /// The [viewModel] parameter is required.
  final ProfileViewModel viewModel;

  /// The [textEditingController] parameter is required.
  final TextEditingController textEditingController;

  /// The [onSubmitted] parameter is required.
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return _TextFieldBody(
      onSubmitted: onSubmitted,
      viewModel: viewModel,
      textEditingController: textEditingController,
    );
  }
}

final class _TextFieldBody extends StatelessWidget {
  const _TextFieldBody({
    required this.viewModel,
    required this.textEditingController,
    required this.onSubmitted,
  });

  final ProfileViewModel viewModel;
  final TextEditingController textEditingController;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return _TextFieldCard(
      textEditingController: textEditingController,
      viewModel: viewModel,
      onSubmitted: onSubmitted,
    );
  }
}

final class _TextFieldCard extends StatelessWidget {
  const _TextFieldCard({
    required this.viewModel,
    required this.textEditingController,
    required this.onSubmitted,
  });

  final ProfileViewModel viewModel;
  final TextEditingController textEditingController;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => TextField(
        keyboardType: TextInputType.name,
        controller: textEditingController,
        onSubmitted: (value) {
          viewModel.updateDisplayName();
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: 'Kullanıucı Adınız',
        ),
      ),
    );
  }
}
