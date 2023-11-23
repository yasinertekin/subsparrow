import 'package:firebase_auth/firebase_auth.dart';

/// AuthState
abstract class AuthState {}

/// AuthInitial
class AuthInitial extends AuthState {}

/// AuthLoading
class AuthLoading extends AuthState {}

/// AuthSuccess
class AuthSuccess extends AuthState {
  /// AuthSuccess constructor
  AuthSuccess(this.user);

  /// User
  final User user;
}

/// AuthFailure

class AuthFailure extends AuthState {
  /// AuthFailure constructor
  AuthFailure(this.error);

  /// Error message
  final String error;
}
