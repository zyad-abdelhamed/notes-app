import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colors.dart';

ThemeData get getdarktheme {
  return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkModePrimaryColor,
          centerTitle: true),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkModePrimaryColor,
        shape: CircleBorder(),
        iconSize: 40
      ),
      iconTheme: const IconThemeData(color: AppColors.darkModePrimaryColor, size: 50),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(AppColors.darkModePrimaryColor),
        iconSize: WidgetStatePropertyAll(35),
      )),
      switchTheme: const SwitchThemeData(
          trackColor: WidgetStatePropertyAll(Colors.white),
          thumbColor: WidgetStatePropertyAll(Colors.black)));
}
