import 'package:get/get.dart';
import 'package:notes_app/core/constants/view_constants.dart';
import 'package:notes_app/core/utils/enums/request_state_enum.dart';
import 'package:notes_app/core/widgets/custom_snake_bar.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';

class FavoriteNotesController extends GetxController {
  FavoriteNotesController(this.baseNoteRepo);

  final BaseNoteRepo baseNoteRepo;
  List<Note> favouriteNotes = [];
  Set<dynamic> favouriteNotesIds = {};
  RequestStateEnum favouriteNotesState = RequestStateEnum.loading;
  String favouriteNotesErrorMessage = '';
  bool visible = false;
  dynamic noteId;
  late Note note;
  int? selectedIndex;

  void getFavouriteNotes() async {
    favouriteNotesState = RequestStateEnum.loading;
    update();

    final result = await baseNoteRepo.getFavoriteNotes();
    result.fold(
      (l) {
        favouriteNotesState = RequestStateEnum.failed;
        favouriteNotesErrorMessage = l.message;
      },
      (r) {
        favouriteNotes = r;
        favouriteNotesIds = r.map((e) => e.id).toSet();
        favouriteNotesState = RequestStateEnum.success;
      },
    );
    update();
  }

  void toggleFavorite(int value, id, {required int index}) async {
    final result = await baseNoteRepo.toggleFavorite(value, id);
    result.fold(
      (l) {
        errorSnackBar(message: l.message);
      },
      (_) {
        _scaleAnimation(id, index);
      },
    );
  }

  void _scaleAnimation(id, int index) {
    selectedIndex = index;
    update();
    Future.delayed(
      ViewConstants.mediumDuration,
      () {
        favouriteNotesIds.contains(id)
            ? favouriteNotesIds.remove(id)
            : favouriteNotesIds.add(id);

        selectedIndex = null;
        update();
      },
    );
  }

  void hideFavoritesPageAppBarActions() {
    visible = false;
    update();
  }

  void removeFromFavorite() {
    toggleFavorite(0, noteId, index: 0);
    visible = false;
    getFavouriteNotes();
    update();
  }

  void showFavoritesPageAppBarActions(id, Note note, int index) {
    noteId = id;
    this.note = note;
    selectedIndex = index;
    visible = true;
    update();
  }

  @override
  void onInit() {
    getFavouriteNotes();
    super.onInit();
  }
}
