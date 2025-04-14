import 'package:dartz/dartz.dart';
import 'package:notes_app/core/erorr/failure.dart';
import 'package:notes_app/featuers/notes/data/models/note_prameter.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';

abstract class BaseNoteRepo {
  Future<Either<Failure, List<Note>>> getNotes();
  Future<Either<Failure, Unit>> addNote(NotePrameter notePrameter);
  Future<Either<Failure, Unit>> updateNote(NotePrameter notePrameter);
  Future<Either<Failure, Unit>> deleteNote();
}