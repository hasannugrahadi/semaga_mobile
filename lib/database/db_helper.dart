import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), "semaga.db");
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE "
        "histories(id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "subject TEXT, "
        "date TEXT, "
        "title TEXT, "
        "startTime TEXT, "
        "endTime TEXT)"
      );
    });
  }

  //History

  Future<int> insertHistory(Map<String, dynamic> history) async {
    final Database db = await database;
    return await db.insert('histories', history);
  }

  Future<List<Map<String, dynamic>>> getHistory() async {
    final Database db = await database;
    return await db.query('histories');
  }

  Future<void> deleteAllHistories() async {
    final Database db = await database;
    await db.delete('histories');
  }

  //Answer



}