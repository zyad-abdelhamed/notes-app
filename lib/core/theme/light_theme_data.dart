import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colors.dart';

ThemeData get getlighttheme {
  return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightModePrimaryColor,
          elevation: 0.0,
          centerTitle: true),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
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
