import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subsparrow/feature/auth/view/auth_view.dart';
import 'package:subsparrow/feature/auth/view_model/cubit/auth_cubit.dart';
import 'package:subsparrow/product/initialize/app_initialize.dart';
import 'package:subsparrow/product/initialize/theme/custom_dark_theme.dart';
import 'package:subsparrow/product/service/auth_service.dart';

Future<void> main() async {
  await AppInitialize().make();

  runApp(const _MyApp());
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomDarkTheme().themeData,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(
              authService: AuthServices(),
            ),
          ),
        ],
        child: const AuthView(),
      ),
    );
  }
}
