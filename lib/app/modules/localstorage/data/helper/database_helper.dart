import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../script/database_script.dart';
import 'database_strings.dart';

class DatabaseHelper {
  Database? _database;

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(DatabaseScript.userTableScript);
  }

  Future<void> _onUpdateDatabase(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {}

  Future<Database> get database async {
    final path = join(
      await getDatabasesPath(),
      DatabaseStrings.name,
    );

    _database ??= await openDatabase(
      path,
      version: 4,
      onCreate: _onCreate,
      onUpgrade: _onUpdateDatabase,
    );

    return _database!;
  }

  Future<void> closeDB() async => await _database?.close();
}
