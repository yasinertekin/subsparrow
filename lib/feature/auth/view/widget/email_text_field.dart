part of '../auth_view.dart';

final class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' StringConstants.email',
          style: context.general.textTheme.bodySmall?.copyWith(
            color: context.general.colorScheme.primary,
          ),
        ),
        TextField(
          controller: emailController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
