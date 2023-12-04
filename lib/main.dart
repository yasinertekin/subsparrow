import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsparrow/feature/auth/view/auth_view.dart';
import 'package:subsparrow/feature/auth/view_model/custom_auth_provider.dart';
import 'package:subsparrow/feature/register/view/register_view.dart';
import 'package:subsparrow/feature/register/view_model/register_view_model.dart';
import 'package:subsparrow/product/initialize/app_initialize.dart';
import 'package:subsparrow/product/initialize/theme/custom_dark_theme.dart';
import 'package:subsparrow/product/service/auth_service.dart';

Future<void> main() async {
  await AppInitialize().make();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CustomAuthProvider(
            AuthServices(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PasswordNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserRegisterViewModel(),
        ),
      ],
      child: const _MyApp(),
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
