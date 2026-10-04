import 'package:flutter_auto_revision/core/model/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database; // Singleton instance of the database

  DatabaseHelper._internal(); // Private constructor for singleton pattern

  // Getter for the database instance
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase(); // Initialize the database if it hasn't been initialized yet
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath(); // Get the default database path for the platform

    final path = join(
      databasePath,
      'auto_revision.db',
    );

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  
  // Create the database schema
  // note are markdown with latex formatted.
  Future<void> _onCreate(
    Database db,
    int version,
  ) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        subject TEXT NOT NULL,
        chapter TEXT NOT NULL,
        topic TEXT NOT NULL,
        note TEXT NOT NULL
      )
    ''');
  }

  // INSERT METHOD HERE
  Future<int> insertNote(Note note) async {
    final db = await database;

    return await db.insert(
      'notes',
      note.toMap(),
    );
  }

  // GET ALL NOTES METHOD HERE
  Future<List<Note>> getNotes() async {
  final db = await database;

  final result = await db.query(
    'notes',
    orderBy: 'id DESC',
  );

  return result.map((map) => Note.fromMap(map)).toList();
}


}