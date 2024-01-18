import 'package:sqflite/sqflite.dart';

import '../../infrastructure/repositories/contracts/database_provider.dart';
import '../helper/database_helper.dart';

class DatabaseProviderImpl implements DatabaseProvider {
  final DatabaseHelper databaseHelper;
  Database? _db;
  DatabaseProviderImpl({
    required this.databaseHelper,
  }) {
    _openDatabase();
  }

  Future<void> _openDatabase() async {
    _db = await databaseHelper.database;
  }

  Future<void> checkDatabase() async {
    if (_db == null) {
      await _openDatabase();
    }
  }

  @override
  Future<int> delete({
    required String table,
    String? where,
    List<String>? whereArgs,
  }) async {
    try {
      await checkDatabase();
      return await _db!.delete(table, where: where, whereArgs: whereArgs);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> insert({
    required String table,
    required Map<String, Object?> values,
  }) async {
    try {
      await checkDatabase();
      final response = await _db!.insert(table, values);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, Object?>>> query({
    required String table,
    String? where,
    List<String>? whereArgs,
    String? orderBy,
  }) async {
    try {
      await checkDatabase();
      final response = await _db!.query(
        table,
        where: where,
        whereArgs: whereArgs,
        orderBy: orderBy,
      );

      return response;
    } catch (e) {
      print('******ERRO QUERY $e');
      rethrow;
    }
  }

  @override
  Future<int> update({
    required String table,
    required Map<String, Object?> values,
    String? where,
    List<String>? whereArgs,
  }) async {
    try {
      await checkDatabase();
      final response = await _db!.update(
        table,
        values,
        where: where,
        whereArgs: whereArgs,
      );

      return response;
    } catch (e) {
      print('***** ERRO UPDATE $e ');
      rethrow;
    }
  }

  @override
  Future<List<Map<String, Object?>>> rawQuery({
    required String sql,
    List<String>? whereArgs,
  }) async {
    try {
      await checkDatabase();
      final response = await _db!.rawQuery(sql, whereArgs);
      return response;
    } catch (e) {
      print('***Erro rawQuery: $e');
      rethrow;
    }
  }

  @override
  Future<void> bulkInsert({
    required String table,
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      await checkDatabase();
      final batch = _db!.batch();
      for (var item in data) {
        batch.insert(table, item);
      }
      await batch.commit();
    } catch (e) {
      print('***Erro bulkInsert: $e');
      rethrow;
    }
  }
}
