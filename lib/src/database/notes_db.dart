import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDb {

  static Database? _database;

  /// Returns the database instance.
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  /// Initializes the database with the given name and creates the 'notes' table.
  Future<Database> _initDB(String databaseName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, databaseName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  /// Creates the 'notes' table with the required columns.
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        note TEXT,
        date TEXT,
        hour TEXT
      );
    ''');
  }

  /// Closes the database instance.
  Future<void> close() async {
    final Database db = await database;

    db.close();
  }
}
