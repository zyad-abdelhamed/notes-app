import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_category_controller.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/app_text_field.dart';

class NoteForm extends StatelessWidget {
  const NoteForm({
    super.key,
    required this.titleHintText,
    required this.descreptionHintText,
  });

  final String titleHintText, descreptionHintText;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteController>(
      builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.addFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // === Title Field ===
                  appTextField(
                    context: context,
                    controller: controller.addTitleTextFieldController,
                    titleHintText: titleHintText,
                    hintStyle: TextStyles.bold23(context: context),
                    maxLines: 2,
                    maxLength: 50,
                  ),

                  const SizedBox(height: 12),

                  // === Dropdown ===
                  GetBuilder<NoteCategoryController>(
                    builder: (noteCategoryController) {
                      return DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          labelText: 'اختر الفئة',
                          border: InputBorder.none,
                        ),
                        value: controller.selectedValue.isEmpty
                            ? null
                            : controller.selectedValue,
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
                          final index =
                              noteCategoryController.categories.indexWhere(
                            (category) => category.categoryName == newValue,
                          );

                          controller.categoryId = index;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى اختيار فئة';
                          }
                          return null;
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  // === Description Field ===
                  SizedBox(
                    height: 200, // ارتفاع مناسب لحقل الوصف
                    child: appTextField(
                      context: context,
                      controller: controller.addDescriptionTextFieldController,
                      titleHintText: descreptionHintText,
                      hintStyle: TextStyles.regular14_150(context),
                      maxLines: null,
                      expands: true,
                      maxLength: null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
