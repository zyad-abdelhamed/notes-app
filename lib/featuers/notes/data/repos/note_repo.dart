import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:notes_app/core/erorr/failure.dart';
import 'package:notes_app/core/services/data_base_service.dart/base_data_base_service.dart';
import 'package:notes_app/featuers/notes/data/models/note_model.dart';
import 'package:notes_app/featuers/notes/data/models/note_prameter.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';

class NoteRepo implements BaseNoteRepo {
  final BaseNotesDataBaseService baseNotesDataBaseService;

  NoteRepo({required this.baseNotesDataBaseService});
  @override
  Future<Either<Failure, Unit>> addNote(NotePrameter notePrameter) async {
    try {
      await baseNotesDataBaseService.insert(notePrameter);
      return const Right(unit);
    } catch (e) {
      return left(LacalDBFailure(message: "localDataBaseErorr".tr));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteNote(dynamic id) async {
    try {
      await baseNotesDataBaseService.delete(id);
      return const Right(unit);
    } catch (e) {
      return left(LacalDBFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getAllNotes() async {
    try {
      List<Map<String, dynamic>> data =
          await baseNotesDataBaseService.fetchData();
      return right(
          List<Note>.from(data.map((e) => NoteModel.fromDataBase(e)).toList()));
    } catch (e) {
      return left(LacalDBFailure(message:e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getFavoriteNotes() async {
    try {
      List<Map<String, dynamic>> data =
          await baseNotesDataBaseService.getFavorites();
      return right(
          List<Note>.from(data.map((e) => NoteModel.fromDataBase(e)).toList()));
    } catch (_) {
      return left(LacalDBFailure(message: "localDataBaseErorr".tr));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getNotesByCategory(
      dynamic categoryId) async {
    try {
      List<Map<String, dynamic>> data =
          await baseNotesDataBaseService.getByCategory(categoryId);
      return right(
          List<Note>.from(data.map((e) => NoteModel.fromDataBase(e)).toList()));
    } catch (_) {
      return left(LacalDBFailure(message: "localDataBaseErorr".tr));
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleFavorite(int value, dynamic id) async {
    try {
      await baseNotesDataBaseService.toggleFavorite(value, id);
      return const Right(unit);
    } catch (_) {
      return left(LacalDBFailure(message: "localDataBaseErorr".tr));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateNote(NotePrameter notePrameter) async {
    try {
      await baseNotesDataBaseService.update(notePrameter, notePrameter.id);
      return const Right(unit);
    } catch (e) {
      return left(LacalDBFailure(message:e.toString()));
    }
  }
}
