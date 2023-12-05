part of '../profile_view.dart';

final class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
    required this.viewModel,
    required this.textEditingController,
    required this.textFieldTitle,
    required this.icon,
    required this.onPressed,
  });

  final ProfileViewModel viewModel;
  final TextEditingController textEditingController;
  final String textFieldTitle;
  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TextFieldTitle(
            textFieldTitle: textFieldTitle,
          ),
          _TextFieldBody(
            viewModel: viewModel,
            textEditingController: textEditingController,
            onPressed: onPressed,
            icon: icon,
          ),
        ],
      ),
    );
  }
}

final class _TextFieldBody extends StatelessWidget {
  const _TextFieldBody({
    required this.viewModel,
    required this.textEditingController,
    required this.onPressed,
    required this.icon,
  });

  final ProfileViewModel viewModel;
  final TextEditingController textEditingController;
  final void Function()? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TextFieldCard(
          textEditingController: textEditingController,
          viewModel: viewModel,
          icon: icon,
        ),
        _CustomIconButton(
          viewModel: viewModel,
          onPressed: onPressed,
        ),
      ],
    );
  }
}

final class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({
    required this.viewModel,
    required this.onPressed,
  });

  final ProfileViewModel viewModel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CircleAvatar(
        child: IconButton(
          icon: const Icon(
            Icons.edit,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

final class _TextFieldCard extends StatelessWidget {
  const _TextFieldCard({
    required this.viewModel,
    required this.textEditingController,
    required this.icon,
  });

  final ProfileViewModel viewModel;
  final TextEditingController textEditingController;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Card(
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

final class _TextFieldTitle extends StatelessWidget {
  const _TextFieldTitle({
    required this.textFieldTitle,
  });

  final String textFieldTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      textFieldTitle,
      style: context.general.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
