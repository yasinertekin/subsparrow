import 'package:flutter/material.dart';
import 'package:subsparrow/product/utility/constants/string_constants.dart';

/// [CustomSearchTextField] is the search field of the application.
final class CustomSearchTextField extends StatelessWidget {
  /// [CustomSearchTextField] is the search field of the application.
  const CustomSearchTextField({
    required this.onTap,
    super.key,
    this.onChanged,
    this.readOnly = false,
    this.autofocus = false,
  });

  /// [onTap] is the function that will be called when
  /// the search field is clicked.
  final void Function()? onTap;

  /// [onChanged] is the function that will be called when
  final void Function(String)? onChanged;

  /// [readOnly] is the function that will be called when
  final bool readOnly;

  /// [autofocus] is the function that will be called when
  final bool autofocus;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: TextField(
        autofocus: autofocus,
        onChanged: onChanged,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          hintText: StringConstants.search,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
