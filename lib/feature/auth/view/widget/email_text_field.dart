part of '../auth_view.dart';

final class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    required this.emailController,
    required this.authInitNotifier,
  });

  final TextEditingController emailController;
  final AuthInitNotifier authInitNotifier;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: authInitNotifier,
      builder: (BuildContext context, Widget? child) => Padding(
        padding: context.padding.low,
        child: TextField(
          onTap: () {
            authInitNotifier.setKeyboardOpen(
              value: context.general.isKeyBoardOpen,
            );
          },
          controller: emailController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: StringConstants.email,
          ),
        ),
      ),
    );
  }
}
