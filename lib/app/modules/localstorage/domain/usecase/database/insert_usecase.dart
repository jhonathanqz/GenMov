import '../../repositories/database_repository.dart';

class InsertUseCase {
  final DatabaseRepository databaseRepository;

  InsertUseCase({
    required this.databaseRepository,
  });

  Future<int> call({
    required String table,
    required Map<String, Object?> values,
  }) async {
    try {
      return await databaseRepository.insert(table: table, values: values);
    } catch (e) {
      rethrow;
    }
  }
}
