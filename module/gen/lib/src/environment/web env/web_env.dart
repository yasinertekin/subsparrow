/*import 'package:envied/envied.dart';
import 'package:gen/src/environment/app_configuration.dart';

part 'web_env.g.dart';

@Envied(path: 'assets/env/.web.env', obfuscate: true)
final class WebEnv implements AppConfiguration {
  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _WebEnv._apiKey;

  @EnviedField(varName: 'APP_ID')
  static final String _appId = _WebEnv._appId;

  @EnviedField(varName: 'MESSAGING_SENDER_ID')
  static final String _messagingSenderId = _WebEnv._messagingSenderId;

  @EnviedField(varName: 'PROJECT_ID')
  static final String _projectId = _WebEnv._projectId;

  @EnviedField(varName: 'STORAGE_BUCKET')
  static final String _storageBucket = _WebEnv._storageBucket;

  @EnviedField(varName: 'AUTH_DOMAIN')
  static final String _authDomain = _WebEnv._authDomain;

  @EnviedField(varName: 'MEASUREMENT_ID')
  static final String _measurementId = _WebEnv._measurementId;

  @override
  String get apiKey => _apiKey;

  @override
  String get appId => _appId;

  @override
  String get authDomain => _authDomain;

  @override
  String get iosBundleId => throw UnimplementedError();

  @override
  String get measurementId => _measurementId;

  @override
  String get messagingSenderId => _messagingSenderId;

  @override
  String get projectId => _projectId;

  @override
  String get storageBucket => _storageBucket;
}
*/