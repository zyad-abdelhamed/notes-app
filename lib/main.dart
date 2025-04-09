import 'package:flutter/material.dart';
import 'package:notes_app/core/extentions/controllers_extention.dart';
import 'package:notes_app/core/localization/localization_proxy.dart';
import 'package:notes_app/core/theme/light_theme_data.dart';
import 'package:notes_app/core/theme/theme_provider.dart';
import 'package:notes_app/featuers/notes/presentation/view/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async{
  BaseLocalization baseLocalization =LocalizationImpl();
   baseLocalization.getLanguage;
runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp()
     
  ));}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.themeController.appTheme,
      home: const HomePage(),
    );
  }
}

