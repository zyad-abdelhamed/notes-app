import 'package:get/get.dart';
import 'package:notes_app/core/erorr/failure.dart';
import 'package:notes_app/core/services/data_base_service.dart/notes_db_impl_by_sqflite.dart';
import 'package:notes_app/featuers/notes/data/models/erorr_handler.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_category_repo.dart';
import 'package:dartz/dartz.dart';

class NoteCategoryRepo
    with BoolianMethodsErorrHandler
    implements BaseNoteCategoryRepo {
  final NotesDatabaseImplBysqflite notesDatabaseImplBysqflite;

  NoteCategoryRepo({required this.notesDatabaseImplBysqflite});

  @override
  Future<Either<Failure, Unit>> deleteCategory(int id) async {
    int result = await notesDatabaseImplBysqflite.deleteCategory(id);
    return handleErorrToBoolianMethods(result);
  }

  @override
  Future<Either<Failure, List<String>>> getAllCategories() async {
    List<Map<String, dynamic>> categories =
        await notesDatabaseImplBysqflite.getAllCategories();
    try {
      return right(List<String>.from(categories.map((e) => e['name']) as List));
    } catch (_) {
      return left(LacalDBFailure(message: "localDataBaseErorr".tr));
    }
  }

  @override
  Future<Either<Failure, Unit>> insertCategory(String name) async {
    int result = await notesDatabaseImplBysqflite.insertCategory(name);
    return handleErorrToBoolianMethods(result);
  }

  @override
  Future<Either<Failure, Unit>> updateCategory(int id, String name) async {
    int result = await notesDatabaseImplBysqflite.updateCategory(id, name);
    return handleErorrToBoolianMethods(result);
  }
}
