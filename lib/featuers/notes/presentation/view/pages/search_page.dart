import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/featuers/notes/presentation/controller/notes_search_controller.dart';
import 'package:notes_app/featuers/notes/presentation/view/components/note_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double textFieldBorderRadius = 50.0;
    const double textFieldHight = 40.0;

    final NotesSearchController notesSearchController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: textFieldHight,
          child: TextField(
            onChanged: (value) => notesSearchController.search(word: value),
            cursorColor: Get.isDarkMode
                ? AppColors.darkModePrimaryColor
                : AppColors.lightModePrimaryColor,
            decoration: InputDecoration(
              hintFadeDuration: ViewConstants.mediumDuration,
              hintText: "SearchHint".tr,
              filled: true,
              fillColor: Get.isDarkMode ? AppColors.black : AppColors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(textFieldBorderRadius),
                  borderSide: BorderSide.none),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
      ),
      body: GetBuilder<NotesSearchController>(
        builder: (controller) {
          return controller.notes.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.notes.length,
                  itemBuilder: (context, index) {
                    return NoteWidget(
                        note: controller.notes.elementAt(index),
                        ifRightWhenDelete: () {
                          controller.deleteNote(index);
                        });
                  },
                )
              : const SizedBox();
        },
      ),
    );
  }
}
