import 'package:flutter/material.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/add_note_form.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

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
      body: AddNoteForm(),
      backgroundColor: AppColors.darkModePrimaryColor,
    );
  }
}
