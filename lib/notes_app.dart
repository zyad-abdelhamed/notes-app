import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/helper_function/get_init_route.dart';
import 'package:notes_app/core/helper_function/get_pages.dart';
import 'package:notes_app/core/localization/localization_controller.dart';
import 'package:notes_app/core/services/bindings/controllers_bindings.dart';
import 'package:notes_app/core/theme/dark_theme_data.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getdarktheme,
      translations: Localization(),
      locale: LocalizationController.currentLanguage,
      initialBinding: ControllersBindings(),
      initialRoute: getInitRoute,
      getPages: getPages,
    );
  }
}