import 'package:get/get.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';

class NotesSearchController extends GetxController {
  List<Note> notes = [];

  void search({required String word}) {
    final NoteController noteController = Get.find();
    notes = noteController.notes
        .where((element) => element.title.toString().startsWith(word))
        .toList();
    if (word == '') notes.clear();
    update();
  }
}
