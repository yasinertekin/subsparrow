import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:gen/src/environment/android%20env/android_env.dart';
import 'package:gen/src/environment/app_configuration.dart';
import 'package:gen/src/environment/ios%20env/ios_env.dart';

/// Application environment manager class
final class AppEnvironment {
  /// Setup application environment
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  /// General application environment setup
  AppEnvironment.general() {
    _config = _getPlatformEnvironment();
  }

  static late final AppConfiguration _config;

  static AppConfiguration _getPlatformEnvironment() {
    if (Platform.isAndroid) {
      return AndroidEnv();
    } else if (Platform.isIOS) {
      return IosEnv();
    } else {
      throw Exception('Unsupported platform');
    }
  }

  /// Firebase options
  static FirebaseOptions get firebaseOptions {
    return FirebaseOptions(
      apiKey: _config.apiKey,
      appId: _config.appId,
      messagingSenderId: _config.messagingSenderId,
      projectId: _config.projectId,
      authDomain: _config.authDomain,
      storageBucket: _config.storageBucket,
      iosBundleId: _config.iosBundleId,
      measurementId: _config.measurementId,
    );
  }
}
