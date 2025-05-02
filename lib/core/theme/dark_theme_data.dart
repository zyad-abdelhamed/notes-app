import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colors.dart';

ThemeData get getdarktheme {
  return ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    tabBarTheme: TabBarThemeData(
       tabAlignment: TabAlignment.center,
            indicatorColor: AppColors.darkModePrimaryColor,labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColors.darkModePrimaryColor)
    ),
    iconTheme: IconThemeData(
      color: AppColors.darkModePrimaryColor
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkModePrimaryColor,
        shape: CircleBorder(),
        iconSize: 40),
        inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.grey.withOpacity(0.1), 
      hintStyle: TextStyle(
        color: AppColors.white,
        fontSize: 16,
      ),
      labelStyle: TextStyle(
        color: AppColors.darkModePrimaryColor,
        fontSize: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.darkModePrimaryColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.darkModePrimaryColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.darkModePrimaryColor, width: 2),
      ),
    ),
  );
}
