import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';
import 'package:subsparrow/product/initialize/app_environment.dart';
import 'package:subsparrow/product/service/notification_service.dart';

@immutable

/// AppInitialize
final class AppInitialize {
  /// Project basic required initialize
  Future<void> make() async {
    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error.toString());
      },
    );
  }

  /// AppInitialize

  Future<void> _initialize() async {
    GetIt.I.registerLazySingleton<INotificationService>(() {
      return NotificationService(
        AwesomeNotifications(),
      )
        ..initializeNotifications()
        ..requestUserPermissions();
    });
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    await DeviceUtility.instance.initPackageInfo();

    AppEnvironment.general();

    ///Firebase
    await Firebase.initializeApp(
      options: AppEnvironment.firebaseOptions,
    );

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);
  }
}
