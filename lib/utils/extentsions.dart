import 'dart:math';

import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}

extension NumExtentsion on num {
  SizedBox get width => SizedBox(width: toDouble());
  SizedBox get height => SizedBox(height: toDouble());
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get all => EdgeInsets.all(toDouble());
  double get toDegrees => this * 180.0 / pi;
  double get toRadians => this * pi / 180.0;
}
