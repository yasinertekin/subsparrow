import 'package:flutter/material.dart';
import 'package:gen/src/model/users/users.dart';

/// [HomeViewModel] HomeView için view model
final class HomeViewModel extends ChangeNotifier {
  /// [totalPrice] toplam fiyat
  double totalPrice = 0;

  /// [subTotalPrice] toplam fiyatı hesaplar
  void subTotalPrice(Users? users) {
    if (users == null || users.subscriptions.isEmpty) {
      totalPrice = 0;
    } else {
      totalPrice = users.subscriptions.map((e) => e.price).reduce(
            (value, element) => value! + element!,
          )!;
    }
    notifyListeners();
  }
}
