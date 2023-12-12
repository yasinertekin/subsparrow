import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsparrow/feature/auth/register/view/register_view.dart';
import 'package:subsparrow/feature/auth/register/view_model/register_view_model.dart';
import 'package:subsparrow/feature/auth/sign/view/auth_view.dart';
import 'package:subsparrow/feature/auth/sign/view_model/auth_view_model.dart';
import 'package:subsparrow/feature/dashboard/view_model/dashboard_view_model.dart';
import 'package:subsparrow/feature/home/view_model/home_view_model.dart';
import 'package:subsparrow/feature/profile/view_model/profile_view_model.dart';
import 'package:subsparrow/feature/subscription/view_model/subscription_view_model.dart';
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
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
        ChangeNotifierProvider(
          create: (_) => RegisterViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(
            AuthServices(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PasswordNotifierTwo(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => SubscriptionViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PasswordNotifier(),
        ),
      ],
      child: child,
    );
  }
}
