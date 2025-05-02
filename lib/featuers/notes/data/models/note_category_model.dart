import 'package:notes_app/featuers/notes/domain/entities/note_category.dart';

class NoteCategoryModel extends NoteCategory {
  const NoteCategoryModel({
    required super.id,
    required super.categoryName,
  });

  factory NoteCategoryModel.fromMap(Map<String, dynamic> map) {
    return NoteCategoryModel(
      id: map['id'] as int,
      categoryName: map['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryName': categoryName,
    };
  }
}
