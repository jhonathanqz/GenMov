import '../../domain/repositories/database_repository.dart';
import 'contracts/database_provider.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final DatabaseProvider databaseProvider;

  DatabaseRepositoryImpl({
    required this.databaseProvider,
  });

  @override
  Future<int> delete({
    required String table,
    String? where,
    List<String>? whereArgs,
  }) async {
    try {
      return await databaseProvider.delete(
        table: table,
        where: where,
        whereArgs: whereArgs,
      );
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
      return await databaseProvider.insert(table: table, values: values);
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
      return await databaseProvider.query(
        table: table,
        where: where,
        whereArgs: whereArgs,
        orderBy: orderBy,
      );
    } catch (e) {
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
      return await databaseProvider.update(
        table: table,
        values: values,
        where: where,
        whereArgs: whereArgs,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, Object?>>> rawQuery({
    required String sql,
    List<String>? whereArgs,
  }) async {
    try {
      return await databaseProvider.rawQuery(sql: sql, whereArgs: whereArgs);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> bulkInsert({
    required String table,
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      return await databaseProvider.bulkInsert(
        table: table,
        data: data,
      );
    } catch (e) {
      rethrow;
    }
  }
}
