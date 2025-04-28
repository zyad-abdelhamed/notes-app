import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/erorr/failure.dart';
import 'package:notes_app/featuers/notes/data/models/note_model.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';

mixin BoolianMethodsErorrHandler {
  Either<Failure, Unit> handleErorrToBoolianMethods(int result) {
    if (result == 1) {
      return const Right(unit);
    } else {
      return left(LacalDBFailure(message: "localDataBaseErorr".tr));
    }
  }
}

mixin NotesGetMethodsErorrHandler {
  Either<Failure, List<Note>> handleErorrToGetMethods(
      List<Map<String, dynamic>> data) {
    try {
      return right(List<Note>.from(data.map((e) => NoteModel.fromDataBase(e))));
    } catch (_) {
      return left(LacalDBFailure(message: "localDataBaseErorr".tr));
    }
  }
}