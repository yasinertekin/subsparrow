import 'package:flutter/material.dart';

/// [CircleLoading] is a widget that shows a circle loading indicator.
final class CircleLoading extends StatelessWidget {
  /// [CircleLoading] is a widget that shows a circle loading indicator.
  const CircleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
