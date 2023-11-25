import 'package:flutter/material.dart';
import 'package:subsparrow/feature/sub_detail/view/sub_detail_view.dart';
import 'package:subsparrow/product/enum/sub_view_enum.dart';

/// SubViewMixin
mixin SubDetailMixin on State<SubDetailView> implements TickerProvider {
  late final PageController _pageController;

  final int _milliseconds = 500;

  /// pageController
  PageController get pageController => _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: SubViewEnum.values.indexOf(SubViewEnum.date),
    );
    super.initState();
  }

  /// checkPickedDate
  Future<void> checkPickedDate(DateTime? pickedDate) async {
    if (pickedDate != null) {
      // Only move to the next page if a date is selected
      await pageController.nextPage(
        duration: Duration(milliseconds: _milliseconds),
        curve: Curves.easeInOut,
      );
    }
  }
}
