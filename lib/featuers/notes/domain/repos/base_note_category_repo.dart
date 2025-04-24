abstract class BaseNoteCategoryRepo {
  // ===== CATEGORY CRUD =====
  Future<int> insertCategory(String name);
  Future<List<Map<String, dynamic>>> getAllCategories();
  Future<int> updateCategory(int id, String name);
  Future<int> deleteCategory(int id);
}