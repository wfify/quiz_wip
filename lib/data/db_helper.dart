import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  // === Singleton ===
  DBHelper._();
  static final DBHelper instance = DBHelper._();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'quiz.db');

    return await openDatabase(
      path,
      version: 3, // naikkan versi biar trigger onUpgrade
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE questions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            questionText TEXT NOT NULL,
            options TEXT NOT NULL, -- opsi dipisahkan dengan '|'
            correctAnswerIndex INTEGER NOT NULL,
            kodeHewan TEXT NOT NULL
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 3) {
          // Tambahkan kolom baru kalau belum ada
          await db.execute('ALTER TABLE questions ADD COLUMN kodeHewan TEXT');
        }
      },
    );
  }

  // === CRUD ===
  Future<int> insertQuestion(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(
      'questions',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getQuestions() async {
    final db = await database;
    return await db.query('questions');
  }

  Future<int> clearQuestions() async {
    final db = await database;
    return await db.delete('questions');
  }
}
