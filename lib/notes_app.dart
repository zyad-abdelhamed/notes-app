import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/helper_function/get_init_route.dart';
import 'package:notes_app/core/helper_function/get_pages.dart';
import 'package:notes_app/core/localization/localization_controller.dart';
import 'package:notes_app/core/services/bindings/controllers_bindings.dart';
import 'package:notes_app/core/services/dependency_injection.dart';
import 'package:notes_app/core/theme/dark_theme_data.dart';
import 'package:notes_app/core/theme/light_theme_data.dart';
import 'package:notes_app/core/theme/theme_controller.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key, this.lang});
  final String? lang;
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getlighttheme,
      darkTheme: getdarktheme,
      themeMode: themeController.currentThemeMode.value,
      translations: sl<LocalizationService>(),
      locale: lang != null ? Locale(lang!) : Get.deviceLocale,
      initialBinding: ControllersBindings(),
      initialRoute: getInitRoute,
      getPages: getPages,
    ),);
  }
}
