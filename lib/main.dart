import 'package:flutter/material.dart';
import 'package:subsparrow/feature/register/view/register_view.dart';
import 'package:subsparrow/product/initialize/app_initialize.dart';
import 'package:subsparrow/product/initialize/state_initialize.dart';
import 'package:subsparrow/product/initialize/theme/custom_dark_theme.dart';

Future<void> main() async {
  await AppInitialize().make();

  runApp(
    const StateInitialize(
      child: _MyApp(),
    ),
  );
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomDarkTheme().themeData,
      home: const RegisterView(),
    );
  }
}
