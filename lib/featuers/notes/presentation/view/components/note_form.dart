import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/app_text_field.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/folders_drop_down_button.dart';

final NoteController controller = Get.find();

class NoteForm extends StatelessWidget {
  const NoteForm({super.key, this.onChanged, this.note});

  final ValueChanged<String>? onChanged;
  final Note? note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: controller.addFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === Title Field ===
            appTextField(
              onChanged: onChanged,
              context: context,
              controller: controller.noteTitleTextFieldController,
              titleHintText: "Title".tr,
              hintStyle: TextStyles.bold23(context: context).copyWith(
                  fontSize: 27,
                  color: Get.isDarkMode ? AppColors.white : AppColors.black),
              maxLines: 2,
              maxLength: 50,
            ),
            // === Dropdown ===
            foldersDropDownButton(context, note: note),
            // === Description Field ===
            Expanded(
              child: appTextField(
                onChanged: onChanged,
                context: context,
                controller: controller.noteDescriptionTextFieldController,
                titleHintText: "Write".tr,
                hintStyle: TextStyles.regular14_150(context).copyWith(
                    color: Get.isDarkMode ? AppColors.white : AppColors.black),
                maxLines: null,
                expands: true,
                maxLength: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
