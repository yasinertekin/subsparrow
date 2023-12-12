import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/users/users.dart';
import 'package:subsparrow/feature/home/view/home_view.dart';
import 'package:subsparrow/feature/home/view_model/home_view_model.dart';
import 'package:subsparrow/product/service/firebase_service.dart';

/// Bu mixin, HomeView sınıfı için kullanılacak
mixin HomeViewMixin on State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  final _firebaseServices = FirebaseServices();

  /// Firebase servislerine erişim sağlar
  FirebaseServices get firebaseServices => _firebaseServices;

  /// Şu anki zamanı tutar
  final now = DateTime.now();

  /// Firebase servislerine erişim sağlar
  final userCollection = FirebaseFirestore.instance.collection('users');

  /// HomeViewModel sınıfına erişim sağlar
  HomeViewModel get homeViewModel => _homeViewModel;

  /// Kullanıcıya ait verileri dinlemeyi durdurur
  bool stopListening = false;

  @override
  @override
  void initState() {
    super.initState();
    homeViewModel.initializeFirebase();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Kullanıcının aboneliklerini kontrol eder ve bildirim gönderir
  void homeViewUsersInit(Users? users, FirebaseServices firebaseServices) {
    processSubscriptionsAndNotify(
      users,
      now,
      firebaseServices,
      userCollection,
    );

    homeViewModel
      ..subTotalPrice(users)
      ..subMonthlyTotalPrice(users);
  }

  /// Kullanıcının aboneliklerini kontrol eder ve bildirim gönderir
  void processSubscriptionsAndNotify(
    Users? users,
    DateTime now,
    FirebaseServices firebaseServices,
    CollectionReference<Map<String, dynamic>> userCollection,
  ) {
    if (users?.subscriptions != null && users?.subscriptions.isNotEmpty == true) {
      now.isAfter(users?.subscriptions.first.endDate ?? DateTime.now())
          ? firebaseServices.setSubscriptions(
              FirebaseAuth.instance.currentUser!.uid,
              users!.subscriptions.first.copyWith(
                status: false,
                icon: users.subscriptions.first.icon,
                platformName: users.subscriptions.first.platformName,
              ),
              userCollection,
            )
          : null;
      final scheduledDate = users?.subscriptions.first.endDate ?? DateTime.now();
      homeViewModel.notificationService.awesomeNotifications.isNotificationAllowed().then(
            (isAllowed) => isAllowed
                ? homeViewModel.scheduledNotification(
                    scheduledDate,
                    users!.subscriptions.first.platformName.toString(),
                    users.subscriptions.first.name.toString(),
                  )
                : null,
          );
    }
  }
}
