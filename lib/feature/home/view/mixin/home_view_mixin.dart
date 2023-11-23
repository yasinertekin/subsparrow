import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subsparrow/feature/home/view/home_view.dart';
import 'package:subsparrow/product/model/user/users.dart';

///
mixin HomeViewMixin on State<HomeView> {
  late final String auth;
  late final DocumentReference<Users> userDocument;
  bool stopListening = false;

  @override
  void initState() {
    super.initState();

    // Move the initialization to initState
    auth = FirebaseAuth.instance.currentUser?.uid ?? '';
    userDocument = FirebaseFirestore.instance.collection('users').doc(auth).withConverter<Users>(
          fromFirestore: (snapshot, _) => Users.fromJson(snapshot.data() ?? {}),
          toFirestore: (users, _) => users.toJson(),
        );
  }

  @override
  void dispose() {
    userDocument.snapshots().listen((event) {}).cancel(); // Bu satır, Stream'i kapatır
    super.dispose();
  }
}
