import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({
    super.key,
  });

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
                  children: [
                    TextFormField(
                      style: TextStyles.bold23(context: context),
                      controller: controller.addTitelTextFieldController,
                      maxLines: 2,
                      maxLength: 10,
                      decoration: InputDecoration(
                          hintText: "Title".tr,
                          hintStyle: TextStyles.bold23(context: context),
                          border: InputBorder.none),
                    ),
                    TextFormField(
                      style: TextStyles.regular14_150(context),
                      controller: controller.addDescreptionTextFieldController,
                      maxLines: 10000,
                      decoration: InputDecoration(
                          hintText: "Write".tr,
                          hintStyle: TextStyles.regular14_150(context),
                          border: InputBorder.none),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
