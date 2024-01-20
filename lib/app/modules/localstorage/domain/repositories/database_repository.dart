abstract class DatabaseRepository {
  Future<List<Map<String, Object?>>> query({
    required String table,
    String? where,
    List<String>? whereArgs,
    String? orderBy,
  });

  Future<List<Map<String, Object?>>> rawQuery({
    required String sql,
    List<String>? whereArgs,
  });

  Future<int> insert({
    required String table,
    required Map<String, Object?> values,
  });

  Future<void> bulkInsert({
    required String table,
    required List<Map<String, dynamic>> data,
  });

  Future<int> delete({
    required String table,
    String? where,
    List<String>? whereArgs,
  });

  Future<int> update({
    required String table,
    required Map<String, Object?> values,
    String? where,
    List<String>? whereArgs,
  });
}
