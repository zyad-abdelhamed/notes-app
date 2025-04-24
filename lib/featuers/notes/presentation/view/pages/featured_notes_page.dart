import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_widget.dart';

class FeaturedNotesPage extends StatelessWidget {
  const FeaturedNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FeaturedNotes".tr
        ),
      ),

      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => NoteWidget()
        ),
    );
  }
}