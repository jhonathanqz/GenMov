import '../../repositories/database_repository.dart';

class RawQueryUsecase {
  final DatabaseRepository databaseRepository;
  RawQueryUsecase({required this.databaseRepository});

  Future<List<Map<String, Object?>>> call({
    required String sql,
    List<String>? whereArgs,
  }) async {
    try {
      return await databaseRepository.rawQuery(
        sql: sql,
        whereArgs: whereArgs,
      );
    } catch (e) {
      rethrow;
    }
  }
}
