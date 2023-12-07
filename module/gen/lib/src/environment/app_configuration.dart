/// App configuration interface
abstract class AppConfiguration {
  /// Api Key
  String get apiKey;

  /// App Id
  String get appId;

  /// Messaging Sender Id
  String get messagingSenderId;

  /// Project Id
  String get projectId;

  /// Storage Bucket
  String get storageBucket;

  /// Measurement Id
  String get measurementId;

  /// Auth Domain
  String get authDomain;

  /// Ios Bundle Id
  String get iosBundleId;
}
