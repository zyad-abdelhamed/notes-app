import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_category_controller.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/app_text_field.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/custom_alert_dialog.dart';
void addFolderFunctionality(BuildContext context) {
    final NoteCategoryController controller = Get.find();
    showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
            contentWidget: (context) => Form(
                  key: controller.categoryFormKey,
                  child: appTextField(
                      context: context,
                      titleHintText: "Enter category name",
                      hintStyle: TextStyles.regular14_150(context)
                          .copyWith(color: Colors.grey),
                      style: TextStyles.semiBold16(context: context),    
                      controller: controller.categoryNameController,
                      maxLines: 2,
                      maxLength: 31),
                ),
            onTap: () {
              controller
                  .addCategory(controller.categoryNameController.text);
            },
            buttonText: 'add',
            title: 'add category'));
  }