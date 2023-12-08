import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';
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
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CustomTextField(
              viewModel: viewModel,
              textEditingController: viewModel.displayNameController,
              textFieldTitle: 'Kullanıcı Adı',
              icon: const Icon(
                Icons.person,
              ),
              onPressed: () => changeNameFunction(viewModel, context),
            ),
            _CustomTextField(
              viewModel: viewModel,
              textEditingController: viewModel.emailController,
              textFieldTitle: 'Email',
              icon: const Icon(
                Icons.email,
              ),
              onPressed: () {
                _mailMessenger(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _mailMessenger(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Email Değiştirme Yakında Eklenecek',
        ),
      ),
    );
  }
}

final class _UploadPhoto extends StatelessWidget {
  const _UploadPhoto({
    required this.viewModel,
  });
  final ProfileViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Profil Fotoğrafı Eklemek İçin Tıklayınız',
          style: context.general.textTheme.titleMedium?.copyWith(
            color: context.general.colorScheme.onSurface,
          ),
        ),
        InkWell(
          onTap: () {
            Logger().i(viewModel.image);
            //    viewModel.firebaseUser?.updatePhotoURL(viewModel.image.toString());
            viewModel.pickImage();
          },
          child: Assets.icons.icPhotoUpload.svg(
            package: 'gen',
            width: context.sized.dynamicHeight(0.25),
          ),
        ),
        ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return viewModel.image != null
                ? Image.file(
                    viewModel.image!,
                    width: context.sized.dynamicHeight(0.3),
                    height: context.sized.dynamicWidth(0.3),
                    fit: BoxFit.cover,
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
