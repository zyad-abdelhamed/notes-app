import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/services/enums/request_state_enum.dart';
import 'package:notes_app/featuers/notes/data/models/note_prameter.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';

class NoteController extends GetxController {
  NoteController({required this.baseNoteRepo});
  final BaseNoteRepo baseNoteRepo;
  ////////////////////
  TextEditingController addTitelTextFieldController = TextEditingController();
  TextEditingController addDescreptionTextFieldController =
      TextEditingController();
  GlobalKey addFormKey = GlobalKey<FormState>();
  ///////////////////
  RequestStateEnum addRequestStateEnum = RequestStateEnum.loading;
  String errorMessageOfAdd = '';
  RequestStateEnum updateRequestStateEnum = RequestStateEnum.loading;
  String errorMessageOfupdate = '';
  RequestStateEnum deleteRequestStateEnum = RequestStateEnum.loading;
  String errorMessageOfDelete = '';
  RequestStateEnum toggleRequestStateEnum = RequestStateEnum.loading;
  String errorMessageOfToggle = '';
  List<Note> notes = [];
  RequestStateEnum getAllRequestStateEnum = RequestStateEnum.loading;
  String errorMessageOfGetAll = '';
  List<Note> favouriteNotes = [];
  RequestStateEnum getFavouroiteRequestStateEnum = RequestStateEnum.loading;
  String errorMessageOfGetFavouroite = '';
  List<Note> notesByCategory = [];
  RequestStateEnum notesByCategoryRequestStateEnum = RequestStateEnum.loading;
  String errorMessageOfnotesByCategory = '';
  ////////////////
  addNotes(NotePrameter notePrameter) async {
    var result = await baseNoteRepo.addNote(notePrameter);
    result.fold((l) {
      addRequestStateEnum = RequestStateEnum.failed;
      errorMessageOfAdd = l.message;
      update();
    }, (r) {
      addRequestStateEnum = RequestStateEnum.success;
      update();
    });
  }

  ////////////////////
  updateNote(NotePrameter notePrameter) async {
    var result = await baseNoteRepo.updateNote(notePrameter);
    result.fold((l) {
      updateRequestStateEnum = RequestStateEnum.failed;
      errorMessageOfupdate = l.message;
      update();
    }, (r) {
      updateRequestStateEnum = RequestStateEnum.success;
      update();
    });
  }

  ///////////////////////
  deleteNote() async {
    var result = await baseNoteRepo.deleteNote();
    result.fold((l) {
      deleteRequestStateEnum = RequestStateEnum.failed;
      errorMessageOfDelete = l.message;
      update();
    }, (r) {
      deleteRequestStateEnum = RequestStateEnum.success;
      update();
    });
  }

  ///////////////////////////////
  toggleFavorite(NotePrameter notePrameter) async {
    var result = await baseNoteRepo.toggleFavorite(notePrameter);
    result.fold((l) {
      toggleRequestStateEnum = RequestStateEnum.failed;
      errorMessageOfToggle = l.message;
      update();
    }, (r) {
      toggleRequestStateEnum = RequestStateEnum.success;
      update();
    });
  }

  ///////////////////////////////
  getAllNotes() async {
    var result = await baseNoteRepo.getAllNotes();
    result.fold((l) {
      getAllRequestStateEnum = RequestStateEnum.failed;
      errorMessageOfGetAll = l.message;
      update();
    }, (r) {
      getAllRequestStateEnum = RequestStateEnum.success;
      notes = r;
      update();
    });
  }

  //////////////////////////////
  getFavouriteNotes() async {
    var result = await baseNoteRepo.getFavoriteNotes();
    result.fold((l) {
      getFavouroiteRequestStateEnum = RequestStateEnum.failed;
      errorMessageOfGetFavouroite = l.message;
      update();
    }, (r) {
      getFavouroiteRequestStateEnum = RequestStateEnum.success;
      favouriteNotes = r;
      update();
    });
  }

  /////////////////////////////
  getNotesByCategory() async {
    var result = await baseNoteRepo.getNotesByCategory();
    result.fold((l) {
      notesByCategoryRequestStateEnum = RequestStateEnum.failed;
      errorMessageOfnotesByCategory = l.message;
      update();
    }, (r) {
      notesByCategoryRequestStateEnum = RequestStateEnum.success;
      notesByCategory = r;
      update();
    });
  }
}
