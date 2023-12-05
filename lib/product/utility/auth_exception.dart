/// AuthException class
final class AuthException implements Exception {
  /// AuthException constructor
  AuthException(this.message);

  /// [message] error message
  final String message;

  @override
  String toString() => 'AuthException: $message';
}
