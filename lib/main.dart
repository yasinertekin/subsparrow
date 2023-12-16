import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsparrow/feature/auth/register/view/register_view.dart';
import 'package:subsparrow/product/base/theme_notifier.dart';
import 'package:subsparrow/product/initialize/app_initialize.dart';
import 'package:subsparrow/product/initialize/state_initialize.dart';
import 'package:subsparrow/product/initialize/theme/custom_light_theme.dart';
import 'package:widgets/index.dart';

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
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      builder: CustomResponsive.build,
      title: 'Flutter Demo',

      theme: themeNotifier.getTheme(),

      darkTheme: CustomLightTheme().themeData,
      // ignore: unnecessary_null_comparison
      home: const RegisterView(),
    );
  }
}
