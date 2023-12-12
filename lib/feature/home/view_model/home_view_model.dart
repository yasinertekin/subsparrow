import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/users/users.dart';
import 'package:get_it/get_it.dart';
import 'package:subsparrow/product/service/notification_service.dart';

/// [HomeViewModel] HomeView için view model
final class HomeViewModel extends ChangeNotifier {
  late String auth;

  /// Kullanıcıya ait verileri tutar
  late DocumentReference<Users> userDocument;

  /// [totalPrice] toplam fiyat
  double totalPrice = 0;
  double monthlyPrice = 0;

  /// [subTotalPrice] toplam fiyatı hesaplar
  void subMonthlyTotalPrice(Users? users) {
    if (users == null || users.subscriptions.isEmpty) {
      totalPrice = 0;
    } else {
      totalPrice = users.subscriptions.map((e) => e.price).reduce(
            (value, element) => value! + element!,
          )!;
    }
    notifyListeners();

    initializeFirebase();
    notifyListeners();
  }

  /// [subMonthlyTotalPrice] toplam fiyatı hesaplar
  void subTotalPrice(Users? users) {
    if (users == null || users.subscriptions.isEmpty) {
      monthlyPrice = 0;
    } else {
      if (users.subscriptions.any((e) => e.status == true)) {
        monthlyPrice = users.subscriptions
            .where((e) => e.status == true)
            .map((e) => e.price)
            .reduce((value, element) => value! + element!)!;
      }
    }
    notifyListeners();

    initializeFirebase();
    notifyListeners();
  }

  void initializeFirebase() {
    auth = FirebaseAuth.instance.currentUser?.uid ?? '';
    userDocument = FirebaseFirestore.instance.collection('users').doc(auth).withConverter<Users>(
          fromFirestore: (snapshot, _) => Users.fromJson(snapshot.data() ?? {}),
          toFirestore: (users, _) => users.toJson(),
        );
  }

  final INotificationService _notificationService = GetIt.instance<INotificationService>();

  INotificationService get notificationService => _notificationService;

  /// Schedule notification
  Future<void> scheduledNotification(
    DateTime dateTime,
    String title,
    String body,
  ) async {
    await _notificationService.scheduledNotification(
      dateTime,
      title,
      body,
    );
    notifyListeners();
  }
}
