import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/helper_function/get_widget_depending_on_reuest_state.dart';
import 'package:notes_app/featuers/notes/presentation/controller/notes_by_category_conroller.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_widget.dart';

class CategoryNotesPage extends StatelessWidget {
  const CategoryNotesPage({super.key, required this.categoryId});
  final int categoryId ;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(body: GetBuilder<NotesByCategoryConroller>(
      builder: (controller) {
        return getWidgetDependingOnReuestState(
            requestStateEnum: controller.categoryState,
            widgetIncaseSuccess: ListView.builder(
              itemCount: controller.notesByCategory.length,
              itemBuilder: (context, index) {
                return NoteWidget(note: controller.notesByCategory[index]);
              },
            ),
            erorrMessage: controller.categoryError);
      },
    ));
  }
}
