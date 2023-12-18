import 'package:flutter/material.dart';
import 'package:subsparrow/feature/profile/view_model/profile_view_model.dart';
import 'package:subsparrow/product/utility/enum/profile_enum.dart';
import 'package:subsparrow/product/widget/change_theme_color_switch_button.dart';
import 'package:subsparrow/product/widget/profile_list_tile.dart';
import 'package:subsparrow/product/widget/sign_out_button.dart';
import 'package:subsparrow/product/widget/user_name_text_field.dart';

/// The [ProfileEnumExtension] extension class is used to get the title of the
extension ProfileEnumExtension on ProfileEnum {
  /// The [title] getter is used to get the title of the list tile.
  String get title => {
        ProfileEnum.changeName: 'Kullanıcı Adı',
        ProfileEnum.changeThemeColor: 'Tema Rengi',
        ProfileEnum.signOut: 'Çıkış Yap',
        ProfileEnum.email: 'E-posta',
      }[this]!;

  /// The [getProfileListTileTitle] method is used to get the
  /// title of the list tile.
  Widget getProfileListTileTitle({
    required BuildContext context,
    required ProfileViewModel viewModel,
  }) {
    switch (this) {
      case ProfileEnum.changeName:
        return ProfileListTile(
          listTileTitle: CustomProfileTextField(
            viewModel: viewModel,
            textEditingController: viewModel.displayNameController,
            onSubmitted: (p0) => viewModel.updateDisplayName(),
          ),
          listTileTrailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        );
      case ProfileEnum.changeThemeColor:
        return const ProfileListTile(
          listTileTitle: Text('Tema Rengi'),
          listTileTrailing: ChangeThemeColorSwitchButton(),
        );
      case ProfileEnum.signOut:
        return ProfileListTile(
          listTileTitle: Text(title),
          listTileTrailing: const SignOutButton(),
        );
      case ProfileEnum.email:
        return ProfileListTile(
          listTileTitle: Text(
            viewModel.email.toString(),
          ),
          listTileTrailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.email),
          ),
        );
    }
  }
}
