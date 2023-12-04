import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:subsparrow/product/service/auth_service.dart';
import 'package:subsparrow/product/service/firebase_service.dart';

/// [UserRegisterViewModel] view model
final class UserRegisterViewModel extends ChangeNotifier {
  final AuthServices _authServices = AuthServices();
  final FirebaseServices _firebaseServices = FirebaseServices();

  /// [users] CollectionReference
  final users = FirebaseFirestore.instance.collection('users');

  /// [userRegister] Function
  Future<void> userRegister(String email, String password) async {
    try {
      final userCredential = await _authServices.createUserWithEmailAndPassword(
        email,
        password,
      );

      final uid = userCredential.user!.uid;

      await addUser(uid);
      notifyListeners();
      // Giriş başarılıysa, burada gerekli bildirimleri yapabilirsiniz.
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else {
        throw 'Error during registration: $e';
      }
    } catch (e) {
      throw 'Error during registration: $e';
    }
  }

  /// [addUser] Function
  Future<void> addUser(
    String uid,
  ) async {
    await _firebaseServices.addUser(
      uid,
      List<Subscriptions>.empty(growable: true),
      users,
    );
  }
}
