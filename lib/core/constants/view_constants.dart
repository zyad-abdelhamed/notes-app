import 'package:flutter/material.dart';

abstract class ViewConstants {
  //genral
  static const Duration lowDuration = Duration(milliseconds: 100);
  static const Duration mediumDuration = Duration(milliseconds: 500);
  static const Duration longDuration = Duration(milliseconds: 1200);

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(
        blurRadius: 2,
        offset: const Offset(0, 2),
        spreadRadius: 1,
        color: Colors.grey.withValues(alpha: .2))
  ];

  static const List<String> constantsLanguagesStrings = <String>[
    "العربيه",
    "English"
  ];
}
