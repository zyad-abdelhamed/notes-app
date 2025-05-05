import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/core/widgets/empty_list_widget.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_category_controller.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/add_folder_functionality.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/app_text_field.dart';

class NoteForm extends StatelessWidget {
  const NoteForm({
    super.key,
    this.note, this.onChanged,
  });

  final Note? note;
   final   ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteController>(
      
      builder: (controller) {
           

        return Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.addFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // === Title Field ===
                appTextField(
                  onChanged:onChanged,
                  context: context,
                  controller: controller.noteTitleTextFieldController,
                  titleHintText: "Title".tr,
                  hintStyle: TextStyles.bold23(context: context).copyWith(
                      fontSize: 27,
                      color:
                          Get.isDarkMode ? AppColors.white : AppColors.black),
                  maxLines: 2,
                  maxLength: 50,
                ),
                // === Dropdown ===
                GetBuilder<NoteCategoryController>(
                  builder: (noteCategoryController) {
                    return noteCategoryController.categories.isNotEmpty
                        ? SizedBox(
                            width: context.width * 1 / 3,
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                labelText: 'الفئة',
                                labelStyle: TextStyles.bold23(context: context)
                                    .copyWith(
                                        color: Get.isDarkMode
                                            ? AppColors.white
                                            : AppColors.black),
                                border: InputBorder.none,
                              ),
                              value:
                                  getFolder(controller, noteCategoryController),
                              items: noteCategoryController.categories
                                  .map((e) => e.categoryName)
                                  .toList()
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                controller.changeValue(newValue!);
                                final index = noteCategoryController.categories
                                    .indexWhere(
                                  (category) =>
                                      category.categoryName == newValue,
                                );

                                controller.categoryId = index;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى اختيار فئة';
                                }
                                return null;
                              },
                            ),
                          )
                        : EmpetyListWidget(
                            text: "there is no any folder",
                            buttonText: "add folder",
                            buttonFunction: () =>
                                addFolderFunctionality(context),
                          );
                  },
                ),
                // === Description Field ===
                Expanded(
                  child: appTextField(
                    onChanged:onChanged,
                    context: context,
                    controller: controller.noteDescriptionTextFieldController,
                    titleHintText: "Write".tr,
                    hintStyle: TextStyles.regular14_150(context).copyWith(
                        color:
                            Get.isDarkMode ? AppColors.white : AppColors.black),
                    maxLines: null,
                    expands: true,
                    maxLength: null,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String? getFolder(NoteController controller,
      NoteCategoryController noteCategoryController) {
    return note == null
        ? controller.selectedValue.isEmpty
            ? null
            : controller.selectedValue
        : noteCategoryController.categories[note!.categoryId].categoryName;
  }
}
