import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/app_colors.dart';

Positioned popUpButton() {
  return Positioned(
    top: 5,
    right: 5,
    child: PopupMenuButton<String>(
      icon: Icon(
        Icons.more_vert,
        color: Get.isDarkMode
            ? AppColors.darkModePrimaryColor
            : AppColors.lightModePrimaryColor,
      ),
      onSelected: (value) {
        if (value == 'add') {
          // نفذ عملية الإضافة
          print('تم اختيار إضافة');
        } else if (value == 'delete') {
          // نفذ عملية الحذف
          print('تم اختيار حذف');
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'add',
          child: Text(
            'إضافة',
            style: TextStyle(
              color: Get.isDarkMode ? AppColors.white : AppColors.black,
            ),
          ),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Text(
            'حذف',
            style: TextStyle(
              color: Get.isDarkMode ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ],
      color: Get.isDarkMode ? AppColors.grey : AppColors.white,
    ),
  );
}
