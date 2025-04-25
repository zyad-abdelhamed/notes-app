import 'package:get/get.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_category_controller.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<NoteController>(() => NoteController(baseNoteRepo: sl()));
    // Get.lazyPut<NoteCategoryController>(
    //     () => NoteCategoryController(baseNoteCategoryRepo: sl()));
  }
}
