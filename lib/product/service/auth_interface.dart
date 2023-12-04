// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';

/// AuthService
abstract class AuthService {
  AuthService();

  Future<UserCredential> signInEmailAndPassword(
    String email,
    String password,
  );

  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  );
  User? getCurrentUser();

  Future<void> signOut();
}
