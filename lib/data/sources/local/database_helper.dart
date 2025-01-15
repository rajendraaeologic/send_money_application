import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'transactions.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE transactions (
          id INTEGER,
          title TEXT,
          body TEXT
        )
      ''');
    });
  }

  static Future<List<Map<String, dynamic>>> fetchTransactions() async {
    final db = await database;
    return await db.query('transactions');
  }

  static Future<int> insertTransaction(Map<String, dynamic> transaction) async {
    final db = await database;
    return await db.insert('transactions', transaction);
  }

  static Future<void> clearDatabase() async {
    final db = await database;
    await db.delete('transactions');
  }
}
