import 'package:dartz/dartz.dart';
import 'package:notes_app/core/erorr/failure.dart';
import 'package:notes_app/core/services/data_base_service.dart/notes_db_impl_by_sqflite.dart';
import 'package:notes_app/featuers/notes/data/models/note_prameter.dart';
import 'package:notes_app/featuers/notes/data/models/erorr_handler.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';

class NoteRepo with BoolianMethodsErorrHandler, NotesGetMethodsErorrHandler implements BaseNoteRepo {
  final NotesDatabaseImplBysqflite notesDatabaseImplBysqflite;

  NoteRepo({required this.notesDatabaseImplBysqflite});
  @override
  Future<Either<Failure, Unit>> addNote(NotePrameter notePrameter) async {
    int result = await notesDatabaseImplBysqflite.insert(notePrameter);
    return handleErorrToBoolianMethods(result);
  }

  @override
  Future<Either<Failure, Unit>> deleteNote(NotePrameter notePrameter) async {
    int result = await notesDatabaseImplBysqflite.delete(notePrameter);
    return handleErorrToBoolianMethods(result);
  }

  @override
  Future<Either<Failure, List<Note>>> getAllNotes() async {
    List<Map<String, dynamic>> data = await notesDatabaseImplBysqflite.getAll();
    return handleErorrToGetMethods(data);
  }

  @override
  Future<Either<Failure, List<Note>>> getFavoriteNotes() async {
    List<Map<String, dynamic>> data =
        await notesDatabaseImplBysqflite.getFavorite();
    return handleErorrToGetMethods(data);
  }

  @override
  Future<Either<Failure, List<Note>>> getNotesByCategory(
      NotePrameter notePrameter) async {
    List<Map<String, dynamic>> data =
        await notesDatabaseImplBysqflite.getByCategory(notePrameter);
    return handleErorrToGetMethods(data);
  }

  @override
  Future<Either<Failure, Unit>> toggleFavorite(
      NotePrameter notePrameter) async {
    int result = await notesDatabaseImplBysqflite.toggleFavorite(notePrameter);
    return handleErorrToBoolianMethods(result);
  }

  @override
  Future<Either<Failure, Unit>> updateNote(NotePrameter notePrameter) async {
    int result = await notesDatabaseImplBysqflite.update(notePrameter);
    return handleErorrToBoolianMethods(result);
  }
}