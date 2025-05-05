import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/helper_function/get_widget_depending_on_reuest_state.dart';
import 'package:notes_app/featuers/notes/presentation/controller/featured_notes_controller.dart';
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

      body: GetBuilder<FeaturedNotesController>(
      builder: (controller) {
        return getWidgetDependingOnReuestState(
            requestStateEnum: controller.favouriteState,
            widgetIncaseSuccess: ListView.builder(
              itemCount: controller.favouriteNotes.length,
              itemBuilder: (context, index) {
                return NoteWidget(note: controller.favouriteNotes[index]);
              },
            ),
            erorrMessage: controller.favouriteError);
      },
    )
    );
  }
}