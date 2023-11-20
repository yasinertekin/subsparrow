// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

final class AdaptAllView extends StatelessWidget {
  const AdaptAllView({
    required this.phone,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  final Widget phone;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) return phone;
    if (ResponsiveBreakpoints.of(context).isMobile) return tablet;
    if (ResponsiveBreakpoints.of(context).isMobile) return desktop;

    return desktop;
  }
}
