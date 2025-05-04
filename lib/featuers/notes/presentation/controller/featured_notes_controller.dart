import 'package:get/get.dart';
import 'package:notes_app/core/services/enums/request_state_enum.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';

class FeaturedNotesController extends GetxController {
  FeaturedNotesController(this.baseNoteRepo);

  final BaseNoteRepo baseNoteRepo;
  List<Note> favouriteNotes = [];
  RequestStateEnum favouriteState = RequestStateEnum.loading;
  String favouriteError = '';
  RequestStateEnum toggleState = RequestStateEnum.loading;
  String toggleError = '';
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
  
}
