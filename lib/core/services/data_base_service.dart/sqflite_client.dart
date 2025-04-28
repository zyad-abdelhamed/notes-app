import 'package:notes_app/core/services/data_base_service.dart/sqflite_data_base.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteClient {
  const SqfliteClient({required this.sqfliteDataBase});
  final SqfliteDataBase sqfliteDataBase;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await sqfliteDataBase.initDB('notes.db');
    return _database!;
  }
}
