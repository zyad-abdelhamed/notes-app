import 'package:dartz/dartz.dart';
import 'package:notes_app/core/erorr/failure.dart';
import 'package:notes_app/featuers/notes/data/models/note_prameter.dart';
import 'package:notes_app/featuers/notes/domain/entities/note.dart';
import 'package:notes_app/featuers/notes/domain/repos/base_note_repo.dart';

class NoteRepo implements BaseNoteRepo{
  @override
  Future<Either<Failure, Unit>> addNote(NotePrameter notePrameter) {
    // TODO: implement addNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteNote() {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Note>>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateNote(NotePrameter notePrameter) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }

}