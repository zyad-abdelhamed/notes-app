import 'package:notes_app/featuers/notes/domain/entities/note.dart';

class NoteModel extends Note {
  const NoteModel(
      {required super.id,
      required super.title,
      required super.descreption,
      required super.createdAt,
      required super.lastUpdate,
      required super.isFeatured,
      required super.categoryId});

  factory NoteModel.fromDataBase(Map<String, dynamic> data) {
    return NoteModel(
        id: data['id'],
        title: data['title'],
        descreption: data['content'],
        createdAt: data['createdAt'],
        lastUpdate: data['updatedAt'],
        isFeatured: data['isFavorite'] == 0 ? false : true,
        categoryId: data['categoryId']);
  }
}
