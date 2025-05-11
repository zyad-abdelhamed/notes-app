import 'package:flutter/material.dart';
import 'package:notes_app/core/localization/localization_controller.dart';
import 'package:notes_app/core/services/data_base_service.dart/sqflite_client.dart';
import 'package:notes_app/core/services/dependency_injection.dart';
import 'package:notes_app/notes_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    DependencyInjection.init();

  await sl<LocalizationService>().load();
  await sl<SqfliteClient>().database;

  runApp(const NotesApp());
}
