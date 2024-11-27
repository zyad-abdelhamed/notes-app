import 'package:flutter/material.dart';

ThemeData get getlighttheme {
  return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true),
      textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(fontSize: 25, color: Colors.black),
          bodyLarge: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          bodyMedium: TextStyle(color: Colors.red),
          bodySmall: TextStyle(color: Colors.black)),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.orange),
      iconTheme: const IconThemeData(color: Colors.orange, size: 50),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(Colors.orange),
        iconSize: WidgetStatePropertyAll(35),
      )),
      switchTheme: const SwitchThemeData(
          trackColor: WidgetStatePropertyAll(Colors.white),
          thumbColor: WidgetStatePropertyAll(Colors.black)));
}
