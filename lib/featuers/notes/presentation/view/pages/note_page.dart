import 'package:flutter/material.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_form.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_widget.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Visibility(
            visible: false,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.done,
                )),
          )
        ],
      ),
      body: NoteForm(
          titleHintText: note.title, descreptionHintText: note.descreption),
      bottomNavigationBar: NoteInfoWidget(
        note: note,
      ),
    );
  }
}
