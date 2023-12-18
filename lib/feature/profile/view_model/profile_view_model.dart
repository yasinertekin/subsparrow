import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  File? _image;

  /// The current user's profile picture.
  File? get image => _image;

  /// Picks an image from the gallery.
  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    _image = File(image.path);
    notifyListeners();
  }

  /// Phone number of the current user.
  late String? phoneNumber = firebaseUser?.phoneNumber.toString();

  /// The controller for the phone number text field.
  final phoneNumberController = TextEditingController(
    text: FirebaseAuth.instance.currentUser?.phoneNumber,
  );

  /// Updates the phone number of the current user.
  Future<void> updatePhoneNumber({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      // Assuming you have the verificationId and smsCode from the user input
      final phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await firebaseUser?.updatePhoneNumber(phoneAuthCredential);

      // Update the phoneNumber variable
      phoneNumber = phoneNumberController.text;

      // Notify listeners about the change
      notifyListeners();
    } catch (e) {
      // Handle the error accordingly
    }
  }

  /// The current user's photo URL.
  bool readOnly = true;

  ///ChangeReadOnly
  void changeReadOnly() {
    readOnly = !readOnly;
    notifyListeners();
  }
}
