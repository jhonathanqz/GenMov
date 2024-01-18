import '../../repositories/database_repository.dart';

class QueryUseCase {
  final DatabaseRepository databaseRepository;

  QueryUseCase({
    required this.databaseRepository,
  });

  Future<List<Map<String, Object?>>> call({
    required String table,
    String? where,
    List<String>? whereArgs,
    String? orderBy,
  }) async {
    try {
      return await databaseRepository.query(
        table: table,
        where: where,
        whereArgs: whereArgs,
        orderBy: orderBy,
      );
    } catch (e) {
      rethrow;
    }
  }
}
