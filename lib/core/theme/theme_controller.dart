import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/constants/cache_constants.dart';
import 'package:notes_app/core/services/cache_service.dart';
import 'package:notes_app/core/services/dependency_injection.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> currentThemeMode =
      (Get.isDarkMode ? ThemeMode.dark : ThemeMode.light).obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromCache();
  }

  void changeTheme(ThemeMode mode) async {
    currentThemeMode.value = mode;

    // حفظ الثيم
    await sl<BaseCache>().insertStringToCache(
      key: CacheConstants.theme,
      value: mode == ThemeMode.dark ? 'dark' : 'light',
    );
  }

  void _loadThemeFromCache() async {
    final theme = sl<BaseCache>().getStringFromCache(key: CacheConstants.theme);

    if (theme == 'dark') {
      currentThemeMode.value = ThemeMode.dark;
    } else {
      currentThemeMode.value = ThemeMode.light;
    }
  }
}
