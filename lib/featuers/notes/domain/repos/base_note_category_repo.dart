import 'package:dartz/dartz.dart';
import 'package:notes_app/core/erorr/failure.dart';

abstract class BaseNoteCategoryRepo {
  Future<Either<Failure, Unit>> insertCategory(String name);
  Future<Either<Failure, List<String>>> getAllCategories();
  Future<Either<Failure, Unit>> updateCategory(int id, String name);
  Future<Either<Failure, Unit>> deleteCategory(int id);
}