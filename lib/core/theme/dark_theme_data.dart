import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colors.dart';

ThemeData get getdarktheme {
  return ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: AppColors.darkModePrimaryColor),
      elevation: 0.0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkModePrimaryColor,
        shape: CircleBorder(),
        iconSize: 40),
  );
}
