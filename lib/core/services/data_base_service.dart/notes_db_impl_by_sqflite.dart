import 'package:notes_app/core/services/data_base_service.dart/base_data_base_service.dart';
import 'package:notes_app/core/services/data_base_service.dart/sqflite_client.dart';

class NotesDatabaseImplBysqflite implements BaseNotesDataBaseService {
  const NotesDatabaseImplBysqflite({required this.sqfliteClient});
  final SqfliteClient sqfliteClient;

  // ===== CATEGORY CRUD =====
  @override
  Future<void> insertCategory(String name) async {
    final db = await sqfliteClient.database;
    await db.insert('categories', {'name': name});
  }

  @override
  Future<List<Map<String, dynamic>>> getAllCategories() async {
    final db = await sqfliteClient.database;
    return await db.query('categories');
  }

  @override
  Future<void> updateCategory(dynamic id, String name) async {
    final db = await sqfliteClient.database;
    await db.update('categories', {'name': name},
        where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> deleteCategory(dynamic id) async {
    final db = await sqfliteClient.database;

    // First, delete all notes in the category
    await db.delete('notes', where: 'categoryId = ?', whereArgs: [id]);

    // Then, delete the category itself
    await db.delete('categories', where: 'id = ?', whereArgs: [id]);
  }

  // ===== NOTE CRUD =====
  String get getCurrentDateTime =>
      DateTime.now().toIso8601String().substring(0, 16);

  @override
  Future<void> insert(dynamic data) async {
    final db = await sqfliteClient.database;
    await db.insert('notes', {
      'title': data.title,
      'content': data.descreption,
      'categoryId': data.categoryId,
      'isFavorite': (data.isFeatured) ?? false ? 1 : 0,
      'createdAt':getCurrentDateTime,
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getByCategory(dynamic categoryId) async {
    final db = await sqfliteClient.database;
    return await db.query('notes',
        where: 'categoryId = ?',
        whereArgs: [categoryId],
        orderBy: 'createdAt DESC');
  }

  @override
  Future<List<Map<String, dynamic>>> fetchData() async {
    final db = await sqfliteClient.database;
    return await db.query('notes', orderBy: 'createdAt DESC');
  }

  @override
  Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await sqfliteClient.database;
    return await db.query('notes',
        where: 'isFavorite = ?', whereArgs: [1], orderBy: 'createdAt DESC');
  }

  @override
  Future<void> update(dynamic newData, dynamic id) async {
    final db = await sqfliteClient.database;
    Map<String, dynamic> values = {
      'title': newData.title,
      'content': newData.descreption,
      'isFavorite': newData.isFeatured! ? 1 : 0,
      'updatedAt': getCurrentDateTime,
    };

    await db.update(
      'notes',
      values,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> toggleFavorite(bool value, dynamic id) async {
    final db = await sqfliteClient.database;
    await db.update(
      'notes',
      {'isFavorite': value},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> delete(dynamic id) async {
    final db = await sqfliteClient.database;
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
