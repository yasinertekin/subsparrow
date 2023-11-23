import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subsparrow/feature/auth/view_model/state/auth_state.dart';
import 'package:subsparrow/product/model/auth/auth.dart';
import 'package:subsparrow/product/service/auth_service.dart';

/// AuthCubit
final class AuthCubit extends Cubit<AuthState> {
  /// AuthCubit constructor
  AuthCubit({
    required AuthService authService,
  })  : _authService = authService,
        super(AuthInitial());
  final AuthService _authService;

  /// Sign up
  Future<void> signIn(
    UserModel auth,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    try {
      emit(AuthLoading());
      final result = await _authService.signIn(
        auth,
        emailController,
        passwordController,
      );
      if (result) {
        final user = FirebaseAuth.instance.currentUser;
        emit(AuthSuccess(user!));
      } else {
        emit(AuthFailure('Invalid email or password'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
