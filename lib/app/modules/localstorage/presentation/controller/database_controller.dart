import 'package:flutter/material.dart';

import '../../domain/usecase/database/bulk_insert_usecase.dart';
import '../../domain/usecase/database/delete_usecase.dart';
import '../../domain/usecase/database/insert_usecase.dart';
import '../../domain/usecase/database/query_usecase.dart';
import '../../domain/usecase/database/raw_query_usecase.dart';
import '../../domain/usecase/database/update_usecase.dart';

class DatabaseController {
  final InsertUseCase _insertUseCase;
  final QueryUseCase _queryUseCase;
  final DeleteUseCase _deleteUseCase;
  final UpdateUseCase _updateUseCase;
  final RawQueryUsecase _rawQueryUsecase;
  final BulkInsertUsecase _bulkInsertUsecase;

  DatabaseController({
    required QueryUseCase queryUseCase,
    required DeleteUseCase deleteUseCase,
    required InsertUseCase insertUseCase,
    required UpdateUseCase updateUseCase,
    required RawQueryUsecase rawQueryUsecase,
    required BulkInsertUsecase bulkInsertUsecase,
  })  : _insertUseCase = insertUseCase,
        _queryUseCase = queryUseCase,
        _deleteUseCase = deleteUseCase,
        _updateUseCase = updateUseCase,
        _rawQueryUsecase = rawQueryUsecase,
        _bulkInsertUsecase = bulkInsertUsecase,
        super();

  Future<int?> insert({
    required String table,
    required Map<String, Object?> values,
  }) async {
    try {
      return await _insertUseCase.call(table: table, values: values);
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> update({
    required String table,
    required Map<String, Object?> values,
    String? where,
    List<String>? whereArgs,
  }) async {
    try {
      return await _updateUseCase.call(
        table: table,
        values: values,
        where: where,
        whereArgs: whereArgs,
      );
    } catch (e) {
      debugPrint('***Erro update: $e');
      rethrow;
    }
  }

  Future<int?> delete({
    required String table,
    String? where,
    List<String>? whereArgs,
  }) async {
    try {
      return await _deleteUseCase.call(
        table: table,
        where: where,
        whereArgs: whereArgs,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, Object?>>?> query({
    required String table,
    String? where,
    List<String>? whereArgs,
    String? orderBy,
  }) async {
    try {
      return await _queryUseCase.call(
        table: table,
        where: where,
        whereArgs: whereArgs,
        orderBy: orderBy,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, Object?>>?> rawQuery({
    required String sql,
    List<String>? whereArgs,
  }) async {
    try {
      return await _rawQueryUsecase.call(
        sql: sql,
        whereArgs: whereArgs,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> bulkInsert({
    required String table,
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      return await _bulkInsertUsecase.call(
        table: table,
        data: data,
      );
    } catch (e) {
      rethrow;
    }
  }
}
