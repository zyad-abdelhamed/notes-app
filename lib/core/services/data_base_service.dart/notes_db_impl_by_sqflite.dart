import 'package:notes_app/core/services/data_base_service.dart/base_data_base_service.dart';
import 'package:notes_app/core/services/data_base_service.dart/sqflite_client.dart';
import 'package:notes_app/featuers/notes/data/models/note_prameter.dart';

class NotesDatabaseImplBysqflite implements BaseDataBaseService {
  SqfliteClient  sqfliteClient = SqfliteClient();

  // ===== CATEGORY CRUD =====
  @override
  Future<int> insertCategory(String name) async {
    final db = await sqfliteClient.database;
    return await db.insert('categories', {'name': name});
  }

  @override
  Future<List<Map<String, dynamic>>> getAllCategories() async {
    final db = await sqfliteClient.database;
    return await db.query('categories');
  }

  @override
  Future<int> updateCategory(int id, String name) async {
    final db = await sqfliteClient.database;
    return await db.update('categories', {'name': name},
        where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> deleteCategory(int id) async {
  final db = await sqfliteClient.database;

  // First, delete all notes in the category
  await db.delete('notes', where: 'categoryId = ?', whereArgs: [id]);

  // Then, delete the category itself
  return await db.delete('categories', where: 'id = ?', whereArgs: [id]);
}


  // ===== NOTE CRUD =====
  @override
  Future<int> insert(NotePrameter notePrameter) async {
    final db = await sqfliteClient.database;
    return await db.insert('notes', {
      'title': notePrameter.title,
      'content': notePrameter.descreption,
      'categoryId': notePrameter.categoryId,
      'isFavorite': (notePrameter.isFeatured) ?? false ? 1 : 0,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getByCategory(
      NotePrameter notePrameter) async {
    final db = await sqfliteClient.database;
    return await db.query('notes',
        where: 'categoryId = ?',
        whereArgs: [notePrameter.categoryId],
        orderBy: 'createdAt DESC');
  }

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await sqfliteClient.database;
    return await db.query('notes', orderBy: 'createdAt DESC');
  }

  @override
  Future<List<Map<String, dynamic>>> getFavorite() async {
    final db = await sqfliteClient.database;
    return await db.query('notes',
        where: 'isFavorite = ?', whereArgs: [1], orderBy: 'createdAt DESC');
  }

  @override
  Future<int> update(NotePrameter notePrameter) async {
    final db = await sqfliteClient.database;
    Map<String, dynamic> values = {
      'title': notePrameter.title,
      'content': notePrameter.descreption,
      'isFavorite': notePrameter.isFeatured! ? 1 : 0,
      'updatedAt': DateTime.now().toIso8601String(),
    };

    return await db.update(
      'notes',
      values,
      where: 'id = ?',
      whereArgs: [notePrameter.id],
    );
  }

  @override
  Future<int> toggleFavorite(NotePrameter notePrameter) async {
    final db = await sqfliteClient.database;
    return await db.update(
      'notes',
      {'isFavorite': notePrameter.isFeatured! ? 1 : 0},
      where: 'id = ?',
      whereArgs: [notePrameter.id],
    );
  }

  @override
  Future<int> delete(NotePrameter notePrameter) async {
    final db = await sqfliteClient.database;
    return await db
        .delete('notes', where: 'id = ?', whereArgs: [notePrameter.id]);
  }
}
