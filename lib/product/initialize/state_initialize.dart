import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsparrow/feature/auth/view/auth_view.dart';
import 'package:subsparrow/feature/auth/view_model/auth_view_model.dart';
import 'package:subsparrow/feature/home/view_model/home_view_model.dart';
import 'package:subsparrow/feature/register/view_model/register_view_model.dart';
import 'package:subsparrow/product/service/auth_service.dart';

/// This class is used to initialize the state of the application.
final class StateInitialize extends StatelessWidget {
  /// This class is used to initialize the state of the application.
  const StateInitialize({
    required this.child,
    super.key,
  });

  /// This class is used to initialize the state of the application.
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(
            AuthServices(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PasswordNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
      ],
      child: child,
    );
  }
}
