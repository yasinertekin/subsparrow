import 'package:flutter/material.dart';
import 'package:subsparrow/feature/home/view/home_view.dart';
import 'package:subsparrow/feature/home/view_model/home_view_model.dart';

/// Bu mixin, HomeView sınıfı için kullanılacak
mixin HomeViewMixin on State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  /// HomeViewModel sınıfına erişim sağlar
  HomeViewModel get homeViewModel => _homeViewModel;

  /// Kullanıcıya ait verileri dinlemeyi durdurur
  bool stopListening = false;

  @override
  void initState() {
    super.initState();
    homeViewModel.initializeFirebase();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
