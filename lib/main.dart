import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/helper_function/get_init_route.dart';
import 'package:notes_app/core/helper_function/get_pages.dart';
import 'package:notes_app/core/localization/localization_proxy.dart';
import 'package:notes_app/core/services/bindings/controllers_bindings.dart';
import 'package:notes_app/core/theme/dark_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(LocalizationController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.isDarkMode ? getdarktheme : getdarktheme,
      translations: Localization(),
      locale: c.currentLanguage,
      initialBinding: ControllersBindings(),
      initialRoute: getInitRoute,
      getPages: getPages,
    );
  }
}
