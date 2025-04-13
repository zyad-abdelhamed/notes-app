import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/extentions/controllers_extention.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/presentation/controller/cubit/add_cubit.dart';

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: context.noteController.addFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyles.bold23(context: context),
                      controller:
                          context.noteController.addTitelTextFieldController,
                      maxLines: 2,
                      maxLength: 10,
                      decoration: InputDecoration(
                          hintText: "Title".tr,
                          hintStyle: TextStyles.bold23(context: context),
                          border: InputBorder.none),
                    ),
                    TextFormField(
                      style: TextStyles.regular14_150(context),
                      controller: context
                          .noteController.addDescreptionTextFieldController,
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
