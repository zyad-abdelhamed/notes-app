import 'package:flutter/material.dart';

ThemeData get getdarktheme {
  return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true),
      textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(fontSize: 25, color: Colors.white),
          bodyLarge: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          bodyMedium: TextStyle(color: Colors.red),
          bodySmall: TextStyle(color: Colors.white),
          displayMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      ),
      iconTheme: const IconThemeData(color: Colors.blue, size: 50),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(Colors.blue),
        iconSize: WidgetStatePropertyAll(35),
      )),
      switchTheme: const SwitchThemeData(
          trackColor: WidgetStatePropertyAll(Colors.white),
          thumbColor: WidgetStatePropertyAll(Colors.black)));
}
