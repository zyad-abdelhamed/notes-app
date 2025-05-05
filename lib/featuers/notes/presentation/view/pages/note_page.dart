import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_form.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_widget.dart';

class NotePage extends StatelessWidget {
  const NotePage({
    super.key,
    required this.note,
  });
  final Note note;

  @override
  Widget build(BuildContext context) {
    final NoteController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(
            () => Visibility(
              visible: controller.isEditing(note),
              child: IconButton(
                  onPressed: () {
                    controller.updateNote(note: note);
                  },
                  icon: const Icon(
                    Icons.done,
                  )),
            ),
          )
        ],
      ),
      body: NoteForm(
        note: note,
        onChanged: (value) => controller.isEditing(note),
      ),
      bottomNavigationBar: NoteInfoWidget(
        note: note,
      ),
    );
  }
}
