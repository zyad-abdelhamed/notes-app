import 'package:notes_app/featuers/notes/domain/repos/base_note_category_repo.dart';

class NoteCategoryRepo implements BaseNoteCategoryRepo{
  @override
  Future<int> deleteCategory(int id) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<int> insertCategory(String name) {
    // TODO: implement insertCategory
    throw UnimplementedError();
  }

  @override
  Future<int> updateCategory(int id, String name) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }
}