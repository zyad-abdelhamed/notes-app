import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/app_colors.dart';

TextFormField appTextField(
    {required BuildContext context,
    required String titleHintText,
    ValueChanged<String>? onChanged,
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
          return "this field can not be empty".tr;
        }
        return null;
      },
      onChanged:onChanged,
      cursorColor: Get.isDarkMode ? AppColors.darkModePrimaryColor : AppColors.lightModePrimaryColor,
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
