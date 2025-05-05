//   aply interface segregation prenciple

abstract class BaseDataBaseService {
  //   ===crud===
  Future<void> insert(dynamic data);
  Future<List<Map<String, dynamic>>> fetchData();
  Future<void> update(dynamic newData, dynamic id);
  Future<void> delete(dynamic id);
  //   ===categories crud===
   Future<List<Map<String, dynamic>>> getAllCategories();
  Future<List<Map<String, dynamic>>> getByCategory(dynamic categoryId);
  Future<void> updateCategory(dynamic id, String newName);
  Future<void> insertCategory(String name);
  Future<void> deleteCategory(dynamic id);
}

abstract class BaseNotesDataBaseService implements BaseDataBaseService{
  Future<List<Map<String, dynamic>>> getFavorites();
  Future<void> toggleFavorite(int value, dynamic id);
}