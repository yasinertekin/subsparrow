import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

final class AdaptMobileView extends StatelessWidget {
  const AdaptMobileView({
    required this.phone,
    required this.tablet,
    super.key,
  });

  /// Define your custom widget for mobile
  final Widget phone;
  final Widget tablet;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) return phone;
    if (ResponsiveBreakpoints.of(context).isMobile) return tablet;

    return tablet;
  }
}
