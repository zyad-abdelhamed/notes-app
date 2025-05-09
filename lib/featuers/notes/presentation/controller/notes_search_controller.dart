import 'package:get/get.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/presentation/controller/get_all_notes.dart';

class NotesSearchController extends GetxController {
  Set<Note> notes = {};

  void search({required String word}) {
    final GetAllNotesController noteController = Get.find();
    notes = noteController.notes
        .where((element) => element.title.toString().startsWith(word))
        .toSet();
    if (word == '') notes.clear();
    update();
  }

  void deleteNote(int index) {
                          notes.remove(notes.elementAt(index));
                          update();
                          Get.back();
                        }
}
