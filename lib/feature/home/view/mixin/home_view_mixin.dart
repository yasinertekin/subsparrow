import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/users/users.dart';
import 'package:subsparrow/feature/home/view/home_view.dart';

/// Bu mixin, HomeView sınıfı için kullanılacak
mixin HomeViewMixin on State<HomeView> {
  late String auth;
  late DocumentReference<Users> userDocument;
  bool stopListening = false;

  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  @override
  void dispose() {
    stopListeningToUserDocument();
    super.dispose();
  }

  /// Firebase'i başlatır
  void initializeFirebase() {
    auth = FirebaseAuth.instance.currentUser?.uid ?? '';
    userDocument = FirebaseFirestore.instance.collection('users').doc(auth).withConverter<Users>(
          fromFirestore: (snapshot, _) => Users.fromJson(snapshot.data() ?? {}),
          toFirestore: (users, _) => users.toJson(),
        );
  }

  /// Kullanıcıya ait verileri dinler
  void stopListeningToUserDocument() {
    if (!stopListening) {
      userDocument.snapshots().listen((event) {}).cancel();
    }
  }
}
