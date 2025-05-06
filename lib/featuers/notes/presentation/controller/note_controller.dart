import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/services/enums/request_state_enum.dart';
import 'package:notes_app/featuers/notes/data/models/note_prameter.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';
import 'package:notes_app/featuers/notes/presentation/controller/get_all_notes.dart';

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
        noteDescriptionTextFieldController.text != note.descreption);

    return soli.value;
  }

  // States and Errors
  RequestStateEnum addState = RequestStateEnum.loading;
  String addError = '';

  RequestStateEnum updateState = RequestStateEnum.loading;
  String updateError = '';

  RequestStateEnum deleteState = RequestStateEnum.loading;
  String deleteError = '';

 

  //========================
  // CRUD OPERATIONS
  //========================

  Future<void> addNote() async {
    if (addFormKey.currentState!.validate() && selectedValue.isNotEmpty) {
      addState = RequestStateEnum.loading;
      update();

      final result = await baseNoteRepo.addNote(NotePrameter(
          categoryId: categoryId,
          title: noteTitleTextFieldController.text,
          descreption: noteDescriptionTextFieldController.text));
      result.fold(
        (l) {
          addState = RequestStateEnum.failed;
          addError = l.message;
          print(l.message);
        },
        (_) {
          addState = RequestStateEnum.success;
          Get.back();
          Get.find<GetAllNotesController>().getAllNotes();
          clearTextEditingControllers();
        },
      );
      update();
    }
  }

  Future<void> updateNote({required Note note}) async {
    updateState = RequestStateEnum.loading;
    update();

    final result = await baseNoteRepo.updateNote(NotePrameter(id:note.id  , categoryId:categoryId , 
          title: noteTitleTextFieldController.text,
          descreption: noteDescriptionTextFieldController.text ));
    result.fold(
      (l) {
        updateState = RequestStateEnum.failed;
        updateError = l.message;

      },
      (_) {
        updateState = RequestStateEnum.success;
        print(note.categoryId );
        Get.back();
      },
    );
    update();
  }

  Future<void> deleteNote(NotePrameter param) async {
    deleteState = RequestStateEnum.loading;
    update();

    final result = await baseNoteRepo.deleteNote(param);
    result.fold(
      (l) {
        deleteState = RequestStateEnum.failed;
        deleteError = l.message;
      },
      (_) {
        deleteState = RequestStateEnum.success;
      },
    );
    update();
  }

 

 

  void clearTextEditingControllers() {
    noteTitleTextFieldController.clear();
    noteDescriptionTextFieldController.clear();
  }

 
}
