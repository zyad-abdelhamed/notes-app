import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/dark_theme_data.dart';
import 'package:notes_app/core/theme/light_theme_data.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> currentThemeMode = (Get.isDarkMode ? ThemeMode.dark : ThemeMode.light).obs;

  void changeTheme(ThemeMode mode) {
    currentThemeMode.value = mode;
    if (mode == ThemeMode.dark) {
      Get.changeTheme(getdarktheme);
    } else {
      Get.changeTheme(getlighttheme);
    }
  }
}
