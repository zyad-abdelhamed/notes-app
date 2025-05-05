import 'package:flutter/material.dart';

TextFormField appTextField(
    {required BuildContext context,
    required String titleHintText,
    required TextStyle hintStyle,
    TextStyle? style,
    required TextEditingController controller,
    int? maxLines,
    bool expands = false,
    int? maxLength}) {
  return TextFormField(
      style: style ?? hintStyle,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'this field can not be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        hintStyle: hintStyle,
        border: InputBorder.none,
        hintText: titleHintText,
      ),
      controller: controller,
      maxLines: maxLines,
      expands: expands,
      maxLength: maxLength);
}
