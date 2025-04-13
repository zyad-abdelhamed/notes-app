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
  );
}
