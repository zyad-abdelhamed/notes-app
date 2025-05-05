import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/theme/text_styles.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';
import 'package:notes_app/featuers/notes/presentation/view/pages/note_page.dart';

class HomeNoteWidget extends StatelessWidget {
  const HomeNoteWidget({super.key, required this.note, });
  final Note note;

  @override
  Widget build(BuildContext context) {
    NoteController noteController = Get.find();
    return GestureDetector(
      onTap: () {
        noteController.noteTitleTextFieldController.text = note.title;
        noteController.noteDescriptionTextFieldController.text = note.descreption;
        
         Get.to(NotePage(note: note,));
      
      },
        
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.blueGrey),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              note.title,
              style: TextStyles.bold23(context: context),
            ),
            Text(
              note.descreption,
              maxLines: 15,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.regular14_150(context),
            ),
          ],
        ),
      ),
    );
  }
}
