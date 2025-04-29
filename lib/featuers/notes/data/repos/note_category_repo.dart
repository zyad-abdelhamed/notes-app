import 'package:get/get.dart';
import 'package:notes_app/core/erorr/failure.dart';
import 'package:notes_app/core/services/data_base_service.dart/base_data_base_service.dart';
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
  Future<Either<Failure, List<String>>> getAllCategories() async {
    List<Map<String, dynamic>> categories =
        await baseNotesDataBaseService.getAllCategories();
    try {
      await baseNotesDataBaseService.deleteCategory(id);
      return right(
          List<String>.from(categories.map((e) => e["name"]).toList()));
    } catch (_) {
      return left(LacalDBFailure(message: "localDataBaseErorr".tr));
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
