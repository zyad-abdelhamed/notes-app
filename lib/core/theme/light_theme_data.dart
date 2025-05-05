import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colors.dart';

ThemeData get getlighttheme {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0
    ),
    tabBarTheme: TabBarThemeData(
        tabAlignment: TabAlignment.center,
        indicatorColor: AppColors.lightModePrimaryColor,
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: AppColors.lightModePrimaryColor)),
    iconTheme: IconThemeData(color: AppColors.lightModePrimaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        splashColor: AppColors.grey,
        backgroundColor: AppColors.lightModePrimaryColor,
        shape: CircleBorder(),
        iconSize: 40),
    popupMenuTheme:
        PopupMenuThemeData(color: Colors.white, iconColor: Colors.grey),    
  );
}
