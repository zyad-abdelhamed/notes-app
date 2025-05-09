import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';

void showDeleteConfirmationDialog(
  BuildContext context, {
  required VoidCallback onConfirm,
}) {
  Get.defaultDialog(
    title: "DeleteConfirmation".tr,
    titleStyle: TextStyles.bold23(context: context),
    middleText: "AreYouSureYouWantToDeleteThisItem".tr,
    middleTextStyle: TextStyles.regular14_150(context),
    radius: 15,
    confirm: ElevatedButton(
      onPressed: onConfirm,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        "Delete".tr,
        style: TextStyle(color: AppColors.white),
      ),
    ),
    cancel: TextButton(
      onPressed: Get.back,
      child: Text(
        "Cancel".tr,
        style: TextStyle(
            color: Get.isDarkMode ? AppColors.white : AppColors.black),
      ),
    ),
  );
}
