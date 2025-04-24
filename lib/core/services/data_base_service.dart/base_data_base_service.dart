import 'package:notes_app/featuers/notes/data/models/note_prameter.dart';

abstract class BaseDataBaseService {
  Future<int> insertCategory(String name);
  Future<List<Map<String, dynamic>>> getAllCategories();
  Future<int> updateCategory(int id, String name);
  Future<int> deleteCategory(int id);
  Future<int> insert(NotePrameter notePrameter);
  Future<List<Map<String, dynamic>>> getByCategory(NotePrameter notePrameter);
  Future<List<Map<String, dynamic>>> getAll();
  Future<List<Map<String, dynamic>>> getFavorite();
  Future<int> update(NotePrameter notePrameter);
  Future<int> delete(NotePrameter notePrameter);
  Future<int> toggleFavorite(NotePrameter notePrameter);  
}
