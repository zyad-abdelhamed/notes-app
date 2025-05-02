import 'package:get/get.dart';
import 'package:notes_app/core/services/dependency_injection.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_category_controller.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteController>(() => NoteController(baseNoteRepo: sl()),
        fenix: true);
    Get.lazyPut<NoteCategoryController>(
        () => NoteCategoryController(baseNoteCategoryRepo: sl()), fenix: true);
  }
}
