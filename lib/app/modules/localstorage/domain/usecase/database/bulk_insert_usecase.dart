import '../../repositories/database_repository.dart';

class BulkInsertUsecase {
  final DatabaseRepository databaseRepository;

  BulkInsertUsecase({
    required this.databaseRepository,
  });

  Future<void> call({
    required String table,
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      return databaseRepository.bulkInsert(table: table, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
