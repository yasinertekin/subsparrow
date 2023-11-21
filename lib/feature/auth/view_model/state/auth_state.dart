import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  AuthSuccess(this.user);
  final User user;
}

class AuthFailure extends AuthState {
  AuthFailure(this.error);
  final String error;
}
