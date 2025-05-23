import 'package:get/get.dart';
import 'package:notes_app/core/erorr/failure.dart';
import 'package:notes_app/core/services/data_base_service.dart/base_data_base_service.dart';
import 'package:notes_app/featuers/notes/data/models/note_category_model.dart';
import 'package:notes_app/featuers/notes/domain/entities/note_category.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_category_repo.dart';
import 'package:dartz/dartz.dart';

class NoteCategoryRepo implements BaseNoteCategoryRepo {
  final BaseNotesDataBaseService baseNotesDataBaseService;

  NoteCategoryRepo({required this.baseNotesDataBaseService});

  @override
  Future<Either<Failure, Unit>> deleteCategory(dynamic id) async {
    try {
      await baseNotesDataBaseService.deleteCategory(id);
      return const Right(unit);
    } catch (_) {
      return left(LacalDBFailure(message: "localDataBaseErorr".tr));
    }
  }

  @override
  Future<Either<Failure, List<NoteCategory>>> getAllCategories() async {
     try {
    List<Map<String, dynamic>> categories =
        await baseNotesDataBaseService.getAllCategories();
   
      return right(
          List<NoteCategory>.from(categories.map((e) => NoteCategoryModel.fromMap(e)).toList()));
    } catch (e) {
      return left(LacalDBFailure(message:e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> insertCategory(String name) async {
    try {
      await baseNotesDataBaseService.insertCategory(name);
      return const Right(unit);
    } catch (_) {
      return left(LacalDBFailure(message: "localDataBaseErorr".tr));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCategory(dynamic id, String name) async {
    try {
      await baseNotesDataBaseService.updateCategory(id, name);
      return const Right(unit);
    } catch (_) {
      return left(LacalDBFailure(message: "localDataBaseErorr".tr));
    }
  }
}
