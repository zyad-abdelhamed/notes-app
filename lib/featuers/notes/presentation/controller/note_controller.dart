import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/widgets/delete_alert_dialog.dart';
import 'package:notes_app/featuers/notes/data/models/note_prameter.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';
import 'package:notes_app/featuers/notes/presentation/controller/get_all_notes.dart';
import 'package:notes_app/featuers/notes/presentation/view/pages/note_page.dart';

class NoteController extends GetxController {
  NoteController({required this.baseNoteRepo});
  final BaseNoteRepo baseNoteRepo;
  RxBool soli = false.obs;
  int? categoryId;
  //dropdownbutton
  String selectedValue = '';
  void changeValue(String value) {
    selectedValue = value;
    update();
  }

  // Form Controllers
  final TextEditingController noteTitleTextFieldController =
      TextEditingController();
  final TextEditingController noteDescriptionTextFieldController =
      TextEditingController();
  final GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

  bool isEditing(Note note) {
    soli.value = (noteTitleTextFieldController.text != note.title ||
        noteDescriptionTextFieldController.text != note.descreption 
        );
    return soli.value;
  }

  // CRUD OPERATIONS
  void addNote() async {
    if (addFormKey.currentState!.validate() && selectedValue.isNotEmpty) {
      final result = await baseNoteRepo.addNote(NotePrameter(
          categoryId: categoryId,
          title: noteTitleTextFieldController.text,
          descreption: noteDescriptionTextFieldController.text));
      result.fold(
        (l) {},
        (_) {
          Get.back();
          Get.find<GetAllNotesController>().getAllNotes();
          clearTextEditingControllers();
        },
      );
      update();
    }
  }

  void updateNote({required Note note}) async {
    final result = await baseNoteRepo.updateNote(NotePrameter(
        id: note.id,
        categoryId: categoryId,
        title: noteTitleTextFieldController.text,
        descreption: noteDescriptionTextFieldController.text));
    result.fold(
      (l) {},
      (_) async {
        Get.back();
        Get.find<GetAllNotesController>().getAllNotes();
        clearTextEditingControllers();
      },
    );
  }

  void deleteNote(BuildContext context,
      {required Note note, required VoidCallback ifRight}) {
    showDeleteConfirmationDialog(context, onConfirm: () async {
      final result = await baseNoteRepo.deleteNote(note.id);
      result.fold(
        (l) {},
        (_) {
          Get.find<GetAllNotesController>().getAllNotes();

          ifRight();
        },
      );
    });
  }

  //   ===helper functions===
  void clearTextEditingControllers() {
    noteTitleTextFieldController.clear();
    noteDescriptionTextFieldController.clear();
    selectedValue = '';
  }

  void goToNotePage(Note note) {
    noteTitleTextFieldController.text = note.title;
    noteDescriptionTextFieldController.text = note.descreption;
    Get.to(NotePage(note: note));
  }
}
