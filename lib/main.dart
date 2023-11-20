import 'package:flutter/material.dart';
import 'package:subsparrow/feature/home/home_view.dart';
import 'package:subsparrow/product/initialize/theme/custom_dark_theme.dart';

void main() {
  runApp(const _MyApp());
}

final class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomDarkTheme().themeData,
      home: const HomeView(),
    );
  }
}
