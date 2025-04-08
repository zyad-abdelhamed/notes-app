abstract class BaseDataBaseService<T> {
  Future<void> add(T item, String path);
  Future<List<T>> getAll(String path);
  Future<void> addAll(List<T> items, String path);
  Future<void> delete(dynamic id, String path);
  Future<void> deleteAll(String path);
}