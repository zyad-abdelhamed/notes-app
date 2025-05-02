import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/app_colors.dart';

void showDeleteConfirmationDialog({
  required VoidCallback onConfirm,
}) {
  Get.defaultDialog(
    title: 'تأكيد الحذف',
    titleStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Get.isDarkMode ? AppColors.white : AppColors.black,
    ),
    middleText: 'هل أنت متأكد أنك تريد حذف هذا العنصر؟',
    middleTextStyle: TextStyle(
      fontSize: 16,
      color: Get.isDarkMode ? AppColors.white : AppColors.black,
    ),
    backgroundColor: Get.isDarkMode ? AppColors.grey2 : AppColors.white,
    radius: 15,
    textCancel: 'إلغاء',
    cancelTextColor: Get.isDarkMode ? AppColors.white : AppColors.black,
    textConfirm: 'حذف',
    confirmTextColor: AppColors.white,
    confirm: ElevatedButton(
      onPressed: () {
        onConfirm();
        Get.back(); // لإغلاق الديالوج بعد التأكيد
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text('حذف'),
    ),
    cancel: TextButton(
      onPressed: () => Get.back(),
      child: Text('إلغاء'),
    ),
  );
}
