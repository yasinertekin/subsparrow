import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// The main profile view widget.
final class ProfileViewModel extends ChangeNotifier {
  /// The current user.
  late final firebaseUser = FirebaseAuth.instance.currentUser;

  /// The current user's display name.
  late String? userName = firebaseUser?.displayName.toString();

  /// The controller for the display name text field.
  final displayNameController = TextEditingController(
    text: FirebaseAuth.instance.currentUser?.displayName,
  );

  /// Updates the display name of the current user.
  void updateDisplayName() {
    firebaseUser?.updateDisplayName(displayNameController.text).toString();
    userName = displayNameController.text;

    notifyListeners();
  }

  /// The current user's email.
  late String? email = firebaseUser?.email.toString();

  /// The controller for the email text field.
  final emailController = TextEditingController(
    text: FirebaseAuth.instance.currentUser?.email,
  );

  /// Updates the email of the current user.
  void updateEmail() {
    firebaseUser?.updateEmail(emailController.text).toString();
    email = emailController.text;

    notifyListeners();
  }
}
