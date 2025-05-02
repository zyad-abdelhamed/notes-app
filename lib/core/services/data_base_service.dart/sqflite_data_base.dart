import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDataBase {
  Future<Database> initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT,
        categoryId INTEGER,
        isFavorite INTEGER NOT NULL DEFAULT 0,
        createdAt TEXT,
        updatedAt TEXT,
        FOREIGN KEY (categoryId) REFERENCES categories (id)
      )
    ''');
  }

  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute("ALTER TABLE notes ADD COLUMN updatedAt TEXT");
    }
  }
}
