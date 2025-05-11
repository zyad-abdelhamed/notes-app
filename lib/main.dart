import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/constants/cache_constants.dart';
import 'package:notes_app/core/localization/localization_controller.dart';
import 'package:notes_app/core/services/cache_service.dart';
import 'package:notes_app/core/services/data_base_service.dart/sqflite_client.dart';
import 'package:notes_app/core/services/dependency_injection.dart';
import 'package:notes_app/core/theme/theme_controller.dart';
import 'package:notes_app/notes_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  await sl<BaseCache>().initializeCache();
  await sl<LocalizationService>().load();
  await sl<SqfliteClient>().database;
  final String? lang =
      sl<BaseCache>().getStringFromCache(key: CacheConstants.lang);
  Get.put(ThemeController());

  runApp(NotesApp(
    lang: lang,
  ));
}
