import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAnim {
  static Animation<Offset> slideAnim(animController) =>
      Tween<Offset>(begin: const Offset(-0.2, 0.0), end: Offset.zero).animate(
          CurvedAnimation(parent: animController, curve: Curves.easeIn));
  static Animation<double> fadeAnim(animController) =>
      Tween<double>(begin: -2.5, end: 1.0).animate(
          CurvedAnimation(parent: animController, curve: Curves.easeInOut));
}
