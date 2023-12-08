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
        ),
      ],
    );
  }
}

final class _TextFieldCard extends StatelessWidget {
  const _TextFieldCard({
    required this.viewModel,
    required this.textEditingController,
  });

  final ProfileViewModel viewModel;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Card(
        elevation: 5,
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) => TextField(
            keyboardType: TextInputType.name,
            readOnly: viewModel.readOnly,
            controller: textEditingController,
            decoration: InputDecoration(
              suffixIcon: _CustomIconButton(viewModel: viewModel),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({
    required this.viewModel,
  });

  final ProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: viewModel.changeReadOnly,
      icon: const Icon(
        Icons.edit,
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
