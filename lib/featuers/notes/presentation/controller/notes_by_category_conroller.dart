import 'package:get/get.dart';
import 'package:notes_app/core/utils/enums/request_state_enum.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';

class NotesByCategoryConroller extends GetxController {
  NotesByCategoryConroller(this.baseNoteRepo);

  final BaseNoteRepo baseNoteRepo;
  List<Note> notesByCategory = [];
  RequestStateEnum categoryState = RequestStateEnum.loading;
  String categoryError = '';
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
