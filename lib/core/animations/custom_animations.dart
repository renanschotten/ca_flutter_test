import 'package:flutter/material.dart';

abstract class CustomAnimations {
  static Animation<Offset> ltrTransition(Animation<double> controller) {
    return Tween<Offset>(
      end: Offset.zero,
      begin: Offset(-2.0, 0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
  }

  static Animation<Offset> rtlTransition(Animation<double> controller) {
    return Tween<Offset>(
      end: Offset.zero,
      begin: Offset(2.0, 0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
  }
}
