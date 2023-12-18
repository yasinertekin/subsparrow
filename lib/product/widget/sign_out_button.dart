import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:subsparrow/feature/auth/sign/view/auth_view.dart';
import 'package:subsparrow/feature/auth/sign/view_model/auth_view_model.dart';
import 'package:widgets/src/widgets/custom_scaffold_messenger.dart';

/// The [SignOutButton] class is used to sign out.
final class SignOutButton extends StatelessWidget {
  /// [SignOutButton] default constructor
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, value, child) => IconButton(
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
        icon: const Icon(Icons.logout),
      ),
    );
  }
}
