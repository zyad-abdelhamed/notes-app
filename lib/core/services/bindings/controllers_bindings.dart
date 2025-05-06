import 'package:get/get.dart';
import 'package:notes_app/core/services/dependency_injection.dart';
import 'package:notes_app/featuers/notes/presentation/controller/featured_notes_controller.dart';
import 'package:notes_app/featuers/notes/presentation/controller/get_all_notes.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_category_controller.dart';
import 'package:notes_app/featuers/notes/presentation/controller/note_controller.dart';
import 'package:notes_app/featuers/notes/presentation/controller/notes_by_category_conroller.dart';
import 'package:notes_app/featuers/notes/presentation/controller/notes_search_controller.dart';
import 'package:notes_app/featuers/splash_screen/presentation/controller/splash_screen_controller.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetAllNotesController>(() => GetAllNotesController(sl()),
        fenix: true);
    Get.lazyPut<SplashScreenController>(() => SplashScreenController(),
        fenix: true);
    Get.lazyPut<NoteController>(() => NoteController(baseNoteRepo: sl()),
        fenix: true);
    Get.lazyPut<NoteCategoryController>(
        () => NoteCategoryController(baseNoteCategoryRepo: sl()),
        fenix: true);
    Get.lazyPut<NotesByCategoryConroller>(() => NotesByCategoryConroller(sl()),
        fenix: true);
    Get.lazyPut<FeaturedNotesController>(() => FeaturedNotesController(sl()),
        fenix: true);
    Get.lazyPut<NotesSearchController>(() => NotesSearchController(),
        fenix: true);
  }
}
