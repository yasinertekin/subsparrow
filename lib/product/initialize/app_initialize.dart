import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';
import 'package:subsparrow/firebase_options.dart';

@immutable

/// AppInitialize
final class AppInitialize {
  /// Project basic required initialize
  Future<void> make() async {
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error.toString());
    });
  }

  /// AppInitialize
  static Future<void> _initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    await DeviceUtility.instance.initPackageInfo();

    ///Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    ///Sistemdeki dataları okuyabilmek için

    FlutterError.onError = (details) {
      /// crashlytics log insert here
      /// custom service or custom logger insert here

      Logger().e(details.exceptionAsString());
    };

    //AppEnvironment.general();
    //  ProductContainer.setup();
  }
}
