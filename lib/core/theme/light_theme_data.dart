import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colors.dart';

ThemeData get getlighttheme {
  return ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: AppColors.lightModePrimaryColor),
        elevation: 0.0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          splashColor: AppColors.grey,
          backgroundColor: AppColors.lightModePrimaryColor,
          shape: CircleBorder(),
          iconSize: 40),
      iconTheme:
          const IconThemeData(color: AppColors.lightModePrimaryColor, size: 50),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(AppColors.lightModePrimaryColor),
        iconSize: WidgetStatePropertyAll(35),
      )),
      switchTheme: const SwitchThemeData(
          trackColor: WidgetStatePropertyAll(Colors.white),
          thumbColor: WidgetStatePropertyAll(Colors.black)));
}
