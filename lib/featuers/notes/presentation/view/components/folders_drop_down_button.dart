import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_category_controller.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';

GetBuilder<NoteCategoryController> foldersDropDownButton(
  BuildContext context, {
  required Note? note,
}) {
  final NoteController controller = Get.find();

  return GetBuilder<NoteCategoryController>(
    builder: (noteCategoryController) {
      const UnderlineInputBorder borderStyle =
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey));

      return noteCategoryController.categories.isNotEmpty
          ? SizedBox(
              width: context.width * 1 / 3,
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: "folder".tr,
                  labelStyle: TextStyles.bold23(context: context).copyWith(
                    color: Get.isDarkMode
                        ? AppColors.darkModePrimaryColor
                        : AppColors.lightModePrimaryColor,
                  ),
                  border: borderStyle,
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  errorBorder: borderStyle,
                  focusedErrorBorder: borderStyle,
                ),
                value: note == null
                    ? controller.selectedValue.isEmpty
                        ? null
                        : controller.selectedValue
                    : noteCategoryController
                        .categories[noteCategoryController.categories
                            .indexWhere(
                                (element) => element.id == note.categoryId)]
                        .categoryName,
                items: noteCategoryController.categories
                    .map((e) => DropdownMenuItem<String>(
                          value: e.categoryName,
                          child: Text(e.categoryName),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  controller.changeValue(newValue!);
                  final index = noteCategoryController.categories.indexWhere(
                    (category) => category.categoryName == newValue,
                  );
                  if (index != -1) {
                    controller.categoryId.value =
                        noteCategoryController.categories[index].id;
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'must choose folder'.tr;
                  }
                  return null;
                },
              ),
            )
          : Container(
              height: 250,
              width: 200,
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? AppColors.black : AppColors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: ViewConstants.shadow),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.warning, size: 50),
                  Text("there is no folders".tr,
                      style: TextStyles.regular14_150(context),
                      textAlign: TextAlign.center),
                  OutlinedButton(
                      onPressed: () => Get.find<NoteCategoryController>()
                          .addCategory(context),
                      child: Text("add folder".tr,
                          style: TextStyles.semiBold16(context: context)
                              .copyWith(
                                  color: Get.isDarkMode
                                      ? AppColors.darkModePrimaryColor
                                      : AppColors.lightModePrimaryColor)))
                ],
              ),
            );
    },
  );
}
