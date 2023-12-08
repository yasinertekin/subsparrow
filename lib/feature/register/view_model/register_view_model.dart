import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:subsparrow/product/service/auth_service.dart';
import 'package:subsparrow/product/service/firebase_service.dart';
import 'package:subsparrow/product/utility/auth_exception.dart';

/// [RegisterViewModel] view model
final class RegisterViewModel extends ChangeNotifier {
  final AuthServices _authServices = AuthServices();
  final FirebaseServices _firebaseServices = FirebaseServices();

  /// [userName] String
  String userName = '';

  /// [setUserName] Function
  void setUserName(String value) {
    userName = value;
    notifyListeners();
  }

  /// [users] CollectionReference
  final users = FirebaseFirestore.instance.collection('users');

  /// [userRegister] Function
  Future<void> userRegister(String email, String password, String value) async {
    try {
      final userCredential = await _authServices.createUserWithEmailAndPassword(
        email,
        password,
      );
      setUserName(value);
      final uid = userCredential.user!.uid;
      final user = FirebaseAuth.instance.currentUser;

      await user!.updateDisplayName(value);

      await addUser(uid);
      notifyListeners();
      // Giriş başarılıysa, burada gerekli bildirimleri yapabilirsiniz.
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = 'Error during registration: $e';
      }

      throw AuthException(errorMessage);
    }
  }

  /// [addUser] Function
  Future<void> addUser(
    String uid,
  ) async {
    await _firebaseServices.addUserSubscriptions(
      uid,
      List<Subscriptions>.empty(growable: true),
      users,
    );
  }
}
