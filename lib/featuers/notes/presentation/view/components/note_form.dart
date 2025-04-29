import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';

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
                    TextFormField(
                        style: TextStyles.bold23(context: context),
                        decoration: InputDecoration(
                            hintText: titleHintText,
                            hintStyle: TextStyles.regular14_150(context),
                            border: InputBorder.none),
                        controller: controller.addTitelTextFieldController,
                        maxLines: 2,
                        maxLength: 10),
                    //   ===descreption text field===
                    TextFormField(
                      style: TextStyles.regular14_150(context),
                      controller: controller.addDescreptionTextFieldController,
                      maxLines: 10000,
                      decoration: InputDecoration(
                          hintText: descreptionHintText,
                          hintStyle: TextStyles.regular14_150(context),
                          border: InputBorder.none),
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
