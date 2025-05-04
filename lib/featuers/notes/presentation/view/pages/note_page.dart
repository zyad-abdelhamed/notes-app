import 'package:flutter/material.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_form.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_widget.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage(
      {super.key, required this.title, required this.descreption});
  final String title, descreption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.done,
              ))
        ],
      ),
      body: NoteForm(titleHintText: title, descreptionHintText: descreption),
    //  bottomNavigationBar: NoteInfoWidget(),
    );
  }
}
