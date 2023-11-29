import 'package:flutter/material.dart';
import 'package:subsparrow/feature/sub_detail/view/sub_detail_view.dart';
import 'package:subsparrow/feature/sub_detail/view_model/sub_detail_notifier.dart';
import 'package:subsparrow/product/enum/sub_view_enum.dart';

/// SubViewMixin
mixin SubDetailMixin on State<SubDetailView> implements TickerProvider {
  late final _subPrices = widget.subDetail?.subPrices?.toJson();

  /// Represents the subPrices for a widget.
  /// This member holds the serialized JSON representation of subPrices
  /// obtained from the widget's subDetail.
  /// It is expected to be in the form of a Map<String, dynamic>.
  /// Example usage:
  /// ```
  /// late final _subPrices = widget.subDetail?.subPrices?.toJson();
  /// Map<String, dynamic> get subPrices => _subPrices!;
  /// ```
  Map<String, dynamic> get subPrices => _subPrices!;

  late final PageController _pageController;

  final int _milliseconds = 500;

  /// pageController
  PageController get pageController => _pageController;

  final SubDetailNotifier _subDetailNotifier = SubDetailNotifier();

  /// subDetailNotifier
  SubDetailNotifier get subDetailNotifier => _subDetailNotifier;

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
