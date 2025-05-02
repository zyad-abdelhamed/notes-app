import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/text_styles.dart';
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
                  children: <TextFormField>[
                    //   ===title text field===
                    appTextField(
                        context: context,
                        controller: controller.addTitleTextFieldController,
                        titleHintText: titleHintText,
                        hintStyle: TextStyles.bold23(context: context),
                        maxLines: 2,
                        maxLength: 10),
                    //   ===descreption text field===
                    appTextField(
                        context: context,
                        titleHintText: titleHintText,
                        hintStyle: TextStyles.regular14_150(context),
                        controller:
                            controller.addDescriptionTextFieldController,
                        maxLines: 10000,
                        maxLength: 1000)
                  ],
                )),
          ),
        );
      },
    );
  }
}
