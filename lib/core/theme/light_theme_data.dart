import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colors.dart';

ThemeData get getlighttheme {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),tabBarTheme: TabBarThemeData(
       tabAlignment: TabAlignment.center,
            indicatorColor: AppColors.lightModePrimaryColor,labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColors.lightModePrimaryColor)
    ),
    iconTheme: IconThemeData(
      color: AppColors.lightModePrimaryColor
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        splashColor: AppColors.grey,
        backgroundColor: AppColors.lightModePrimaryColor,
        shape: CircleBorder(),
        iconSize: 40),
        inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.grey.withOpacity(0.1), 
      hintStyle: TextStyle(
        color: AppColors.lightModePrimaryColor.withOpacity(0.5),
        fontSize: 16,
      ),
      labelStyle: TextStyle(
        color: AppColors.lightModePrimaryColor,
        fontSize: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.lightModePrimaryColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.lightModePrimaryColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.lightModePrimaryColor, width: 2),
      ),
    ),
  );
}
