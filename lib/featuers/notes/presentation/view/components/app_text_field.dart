import 'dart:math';

import 'package:flutter/material.dart';

appTextField(
    {required BuildContext context,
    required String titleHintText,
    required TextStyle hintStyle,
    required TextEditingController controller,
     int? maxLines,
     bool expands = false,
     int? maxLength}) {
  return Theme(
    data: ThemeData(
      inputDecorationTheme:
          InputDecorationTheme(hintStyle: hintStyle, border: InputBorder.none),
    ),
    child: TextFormField(
      
        style: hintStyle,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'this field is can not be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: titleHintText,
        ),
        controller: controller,
        maxLines: maxLines,
        expands:expands ,
        maxLength: maxLength),
  );
}
