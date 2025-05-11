import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/helper_function/get_widget_depending_on_reuest_state.dart';
import 'package:notes_app/core/widgets/empty_list_widget.dart';
import 'package:notes_app/featuers/notes/domain/entities/note_category.dart';
import 'package:notes_app/featuers/notes/presentation/controller/notes_by_category_conroller.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_widget.dart';

class CategoryNotesPage extends StatelessWidget {
  const CategoryNotesPage(
      {super.key, required this.category, required this.appBarTitle});
  final NoteCategory category;

  final String appBarTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: FittedBox(fit: BoxFit.scaleDown, child: Text(appBarTitle))),
        body: GetBuilder<NotesByCategoryConroller>(
          builder: (controller) {
            return controller.notesByCategory.isNotEmpty
                ? getWidgetDependingOnReuestState(
                    requestStateEnum: controller.categoryState,
                    widgetIncaseSuccess: ListView.builder(
                      itemCount: controller.notesByCategory.length,
                      itemBuilder: (context, index) {
                        return NoteWidget(
                          index: index,
                          note: controller.notesByCategory[index],
                          ifRightWhenDelete: (){
                            controller.getNotesByCategory(category.id);
                            Get.back();
                          });
                      },
                    ),
                    erorrMessage: controller.categoryError)
                : Center(child: EmpetyListWidget(text: "there is no notes in this folder".tr));
          },
        ));
  }
}
