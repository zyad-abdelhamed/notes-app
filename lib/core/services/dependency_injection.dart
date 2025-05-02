import 'package:get_it/get_it.dart';
import 'package:notes_app/core/services/data_base_service.dart/base_data_base_service.dart';
import 'package:notes_app/core/services/data_base_service.dart/notes_db_impl_by_sqflite.dart';
import 'package:notes_app/core/services/data_base_service.dart/sqflite_client.dart';
import 'package:notes_app/core/services/data_base_service.dart/sqflite_data_base.dart';
import 'package:notes_app/featuers/notes/data/repos/note_category_repo.dart';
import 'package:notes_app/featuers/notes/data/repos/note_repo.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_category_repo.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';

GetIt sl = GetIt.instance;

class DependencyInjection {
  static void init() {
    ////////////////////////repos
    sl.registerLazySingleton<BaseNoteCategoryRepo>(
        () => NoteCategoryRepo(baseNotesDataBaseService: sl()));
    sl.registerLazySingleton<BaseNoteRepo>(
        () => NoteRepo(baseNotesDataBaseService: sl()));
    ///////////////services
    sl.registerLazySingleton<BaseNotesDataBaseService>(
        () => NotesDatabaseImplBysqflite(sqfliteClient: sl()));
    sl.registerLazySingleton<SqfliteClient>(
        () => SqfliteClient(sqfliteDataBase: sl()));
    sl.registerLazySingleton<SqfliteDataBase>(() => SqfliteDataBase());
  }
}
