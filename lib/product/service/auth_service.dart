import 'package:firebase_auth/firebase_auth.dart';
import 'package:subsparrow/product/service/auth_interface.dart';

/// This class is responsible for creating auth service object
final class AuthServices extends AuthService {
  /// Returns the current user.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserCredential> signInEmailAndPassword(String email, String password) async {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }
}
