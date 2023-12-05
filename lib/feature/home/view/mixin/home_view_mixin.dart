import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/users/users.dart';
import 'package:subsparrow/feature/home/view/home_view.dart';
import 'package:subsparrow/feature/home/view_model/home_view_model.dart';

/// Bu mixin, HomeView sınıfı için kullanılacak
mixin HomeViewMixin on State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  /// HomeViewModel sınıfına erişim sağlar
  HomeViewModel get homeViewModel => _homeViewModel;

  /// Kullanıcıya ait verileri tutar
  late String auth;

  /// Kullanıcıya ait verileri tutar
  late DocumentReference<Users> userDocument;

  /// Kullanıcıya ait verileri dinlemeyi durdurur
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
