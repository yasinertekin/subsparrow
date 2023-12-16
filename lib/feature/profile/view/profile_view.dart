import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:subsparrow/feature/auth/sign/view/auth_view.dart';
import 'package:subsparrow/feature/auth/sign/view_model/auth_view_model.dart';
import 'package:subsparrow/feature/profile/view/mixin/profile_mixin.dart';
import 'package:subsparrow/feature/profile/view_model/profile_view_model.dart';
import 'package:subsparrow/product/base/theme_notifier.dart';
import 'package:subsparrow/product/initialize/theme/custom_dark_theme.dart';
import 'package:subsparrow/product/initialize/theme/custom_light_theme.dart';
import 'package:widgets/src/widgets/custom_scaffold_messenger.dart';

part 'widget/change_theme_color_switch_button.dart';
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
            Consumer<AuthViewModel>(
              builder: (context, value, child) => ElevatedButton(
                onPressed: () {
                  CustomSnackBar.show(
                    context: context,
                    content: const Text('Çıkış yapılıyor...'),
                  );
                  value.authService.signOut();
                  context.route.navigateToPage(
                    const AuthView(),
                  );
                },
                child: const Text('Çıkış Yap'),
              ),
            ),
            const _ChangeThemeColorSwitchButton(),
          ],
        ),
      ),
    );
  }

  void _mailMessenger(BuildContext context) {
    CustomSnackBar.show(
      context: context,
      content: const Text('Mail değiştirme işlemi henüz aktif değil.'),
    );
  }
}
