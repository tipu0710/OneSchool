import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  final Widget mobile, tablet, desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, boxConstraints) {
        if (boxConstraints.maxWidth < 450) {
          return mobile;
        } else if (boxConstraints.maxWidth >= 450 &&
            boxConstraints.maxWidth < 980) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
