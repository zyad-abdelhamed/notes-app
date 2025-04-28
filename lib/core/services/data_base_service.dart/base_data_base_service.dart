import 'package:notes_app/featuers/notes/data/models/note_prameter.dart';

// aply interface segregation prenciple
mixin BaseCrudDataBaseService {
  Future<int> insert(NotePrameter notePrameter);
  Future<List<Map<String, dynamic>>> getAll();
  Future<int> update(NotePrameter notePrameter);
  Future<int> delete(NotePrameter notePrameter);
}

mixin BaseFavoriteDataBaseService {
  Future<List<Map<String, dynamic>>> getFavorite();
  Future<int> toggleFavorite(NotePrameter notePrameter);
}

mixin BaseCategoriesDataBaseService {
  Future<List<Map<String, dynamic>>> getAllCategories();
  Future<List<Map<String, dynamic>>> getByCategory(NotePrameter notePrameter);
  Future<int> updateCategory(int id, String name);
  Future<int> insertCategory(String name);
  Future<int> deleteCategory(int id);
}
