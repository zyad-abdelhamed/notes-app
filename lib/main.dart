import 'package:flutter/material.dart';
import 'package:notes_app/core/localization/languages/localization_proxy.dart';
import 'package:notes_app/core/theme/dark_theme_data.dart';
import 'package:notes_app/core/theme/light_theme_data.dart';
import 'package:notes_app/featuers/notes/presentation/view/pages/home_page.dart';

void main() async{
  BaseLocalization baseLocalization =LocalizationImpl();
  await baseLocalization.getLanguage;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getlighttheme,
      home: const HomePage(),
    );
  }
}

