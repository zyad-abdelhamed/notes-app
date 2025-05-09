import 'package:get/get.dart';
import 'package:notes_app/core/utils/enums/request_state_enum.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';

class GetAllNotesController extends GetxController {
  GetAllNotesController(this.baseNoteRepo);

 final BaseNoteRepo baseNoteRepo;
  // Notes Data
  List<Note> notes = [];
  RequestStateEnum allNotesState = RequestStateEnum.loading;
  String allNotesError = '';

    void getAllNotes() async {
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
    super.onInit();
    getAllNotes();
  }
}
