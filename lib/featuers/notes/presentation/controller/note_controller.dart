import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/services/enums/request_state_enum.dart';
import 'package:notes_app/featuers/notes/data/models/note_prameter.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';

class NoteController extends GetxController {
  NoteController({required this.baseNoteRepo});
  final BaseNoteRepo baseNoteRepo;

  int? categoryId;
  //dropdownbutton
  String selectedValue = '';

  bool get isValid => selectedValue.isNotEmpty;

  void changeValue(String value) {
    selectedValue = value;
    update(); // تحديث الواجهة
  }

  // Form Controllers
  TextEditingController addTitleTextFieldController = TextEditingController();
  TextEditingController addDescriptionTextFieldController =
      TextEditingController();
  GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

  // Notes Data
  List<Note> notes = [];

  // States and Errors
  RequestStateEnum addState = RequestStateEnum.loading;
  String addError = '';

  RequestStateEnum updateState = RequestStateEnum.loading;
  String updateError = '';

  RequestStateEnum deleteState = RequestStateEnum.loading;
  String deleteError = '';

  RequestStateEnum allNotesState = RequestStateEnum.loading;
  String allNotesError = '';

  //========================
  // CRUD OPERATIONS
  //========================

  Future<void> addNote() async {
    if (addFormKey.currentState!.validate() && selectedValue.isNotEmpty) {
      addState = RequestStateEnum.loading;
      update();

      final result = await baseNoteRepo.addNote(NotePrameter(
          categoryId: categoryId,
          title: addTitleTextFieldController.text,
          descreption: addDescriptionTextFieldController.text));
      result.fold(
        (l) {
          addState = RequestStateEnum.failed;
          addError = l.message;
        },
        (_) {
          addState = RequestStateEnum.success;
          Get.back();
        },
      );
      update();
    }
  }

  Future<void> updateNote(NotePrameter param) async {
    updateState = RequestStateEnum.loading;
    update();

    final result = await baseNoteRepo.updateNote(param);
    result.fold(
      (l) {
        updateState = RequestStateEnum.failed;
        updateError = l.message;
      },
      (_) {
        updateState = RequestStateEnum.success;
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

  Future<void> getAllNotes() async {
    allNotesState = RequestStateEnum.loading;
    update();

    final result = await baseNoteRepo.getAllNotes();
    result.fold(
      (l) {
        allNotesState = RequestStateEnum.failed;
        allNotesError = l.message;
        update();
      },
      (r) {
        notes = r;
        allNotesState = RequestStateEnum.success;
        update();
      },
    );
  }
  @override
  void onInit() {
    getAllNotes();
    super.onInit();
  }
}
