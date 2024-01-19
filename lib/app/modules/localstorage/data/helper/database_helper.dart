import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../script/database_script.dart';
import '../script/migration_script.dart';
import 'database_strings.dart';

class DatabaseHelper {
  Database? _database;

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(DatabaseScript.productsStockTableScript);
    await db.execute(DatabaseScript.productsStockConfirmedTableScript);
    await db.execute(DatabaseScript.repositionTableScript);
    await db.execute(DatabaseScript.productsRepositionConfirmedTableScript);
    await db.execute(DatabaseScript.inventoryTableScript);
    await db.execute(DatabaseScript.inventoryProductsTableScript);
    await db.execute(DatabaseScript.inventoryStockTableScript);
    await db.execute(DatabaseScript.userTableScript);
    await db.execute(DatabaseScript.repositionItensRemoteScript);
  }

  Future<void> _onUpdateDatabase(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    if (oldVersion == 1 && newVersion == 3) {
      await db.execute(DatabaseScript.inventoryTableScript);
      await db.execute(DatabaseScript.inventoryProductsTableScript);
      await db.execute(DatabaseScript.inventoryStockTableScript);
      await db.execute(DatabaseScript.userTableScript);
    }
    if (oldVersion == 1 && newVersion == 2) {
      await db.execute(DatabaseScript.inventoryTableScript);
      await db.execute(DatabaseScript.inventoryProductsTableScript);
      await db.execute(DatabaseScript.inventoryStockTableScript);
    }
    if (oldVersion == 2 && newVersion == 3) {
      await db.execute(DatabaseScript.userTableScript);
    }
    if (oldVersion == 3 && newVersion == 4) {
      await db.execute(DatabaseScript.repositionItensRemoteScript);
      await db.execute(
          MigrationScript.migrationProductsRepositionConfirmedTableScript);
    }
  }

  Future<Database> get database async {
    final path = join(
      await getDatabasesPath(),
      DatabaseStrings.name,
    );

    final oldPath = join(
      await getDatabasesPath(),
      'var_express.db',
    );

    final exists = await databaseExists(oldPath);
    if (exists) {
      await deleteDatabase(oldPath);
    }

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
