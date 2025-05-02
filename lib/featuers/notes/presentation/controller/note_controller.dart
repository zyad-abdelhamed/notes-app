import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/services/enums/request_state_enum.dart';
import 'package:notes_app/featuers/notes/data/models/note_prameter.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';

class NoteController extends GetxController {
  NoteController({required this.baseNoteRepo});
  final BaseNoteRepo baseNoteRepo;

  // Form Controllers
  TextEditingController addTitleTextFieldController = TextEditingController();
  TextEditingController addDescriptionTextFieldController = TextEditingController();
  GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

  // Notes Data
  List<Note> notes = [];
  List<Note> favouriteNotes = [];
  List<Note> notesByCategory = [];

  // States and Errors
  RequestStateEnum addState = RequestStateEnum.loading;
  String addError = '';

  RequestStateEnum updateState = RequestStateEnum.loading;
  String updateError = '';

  RequestStateEnum deleteState = RequestStateEnum.loading;
  String deleteError = '';

  RequestStateEnum toggleState = RequestStateEnum.loading;
  String toggleError = '';

  RequestStateEnum allNotesState = RequestStateEnum.loading;
  String allNotesError = '';

  RequestStateEnum favouriteState = RequestStateEnum.loading;
  String favouriteError = '';

  RequestStateEnum categoryState = RequestStateEnum.loading;
  String categoryError = '';

  //========================
  // CRUD OPERATIONS
  //========================

  Future<void> addNote(NotePrameter param) async {
    addState = RequestStateEnum.loading;
    update();

    final result = await baseNoteRepo.addNote(param);
    result.fold(
      (l) {
        addState = RequestStateEnum.failed;
        addError = l.message;
      },
      (_) {
        addState = RequestStateEnum.success;
      },
    );
    update();
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

  Future<void> toggleFavorite(bool value, dynamic id) async {
    toggleState = RequestStateEnum.loading;
    update();

    final result = await baseNoteRepo.toggleFavorite(value, id);
    result.fold(
      (l) {
        toggleState = RequestStateEnum.failed;
        toggleError = l.message;
      },
      (_) {
        toggleState = RequestStateEnum.success;
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
      },
      (r) {
        notes = r;
        allNotesState = RequestStateEnum.success;
      },
    );
    update();
  }

  Future<void> getFavouriteNotes() async {
    favouriteState = RequestStateEnum.loading;
    update();

    final result = await baseNoteRepo.getFavoriteNotes();
    result.fold(
      (l) {
        favouriteState = RequestStateEnum.failed;
        favouriteError = l.message;
      },
      (r) {
        favouriteNotes = r;
        favouriteState = RequestStateEnum.success;
      },
    );
    update();
  }

  Future<void> getNotesByCategory(dynamic categoryId) async {
    categoryState = RequestStateEnum.loading;
    update();

    final result = await baseNoteRepo.getNotesByCategory(categoryId);
    result.fold(
      (l) {
        categoryState = RequestStateEnum.failed;
        categoryError = l.message;
      },
      (r) {
        notesByCategory = r;
        categoryState = RequestStateEnum.success;
      },
    );
    update();
  }
}
