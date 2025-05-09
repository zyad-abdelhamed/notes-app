import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_form.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Get.back();
            controller.clearTextEditingControllers();
          },
        ),
        title: Text(
          "AddNote".tr,
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.addNote();
              },
              icon: const Icon(
                Icons.done,
              ))
        ],
      ),
      body: NoteForm(),
    );
  }
}
