import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subsparrow/feature/auth/view_model/state/auth_state.dart';
import 'package:subsparrow/product/model/auth/auth.dart';
import 'package:subsparrow/product/service/auth_service.dart';

final class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required AuthService authService,
  })  : _authService = authService,
        super(AuthInitial());
  final AuthService _authService;

  Future<void> signIn(
    UserModel auth,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    try {
      emit(AuthLoading()); // Yükleme durumunu yayınlayın
      final result = await _authService.signIn(
        auth,
        emailController,
        passwordController,
      ); // Kullanıcıyı giriş yapın
      if (result) {
        final user = FirebaseAuth.instance.currentUser; // Mevcut kullanıcıyı alın
        emit(AuthSuccess(user!)); // Başarılı durumu yayınlayın
      } else {
        emit(AuthFailure('Invalid email or password')); // Hata durumunu yayınlayın
      }
    } catch (e) {
      emit(AuthFailure(e.toString())); // Hata durumunu yayınlayın
    }
  }
}
