import '../../repositories/database_repository.dart';

class UpdateUseCase {
  final DatabaseRepository databaseRepository;

  UpdateUseCase({
    required this.databaseRepository,
  });

  Future<int> call({
    required String table,
    required Map<String, Object?> values,
    String? where,
    List<String>? whereArgs,
  }) async {
    try {
      return await databaseRepository.update(
        table: table,
        values: values,
        where: where,
        whereArgs: whereArgs,
      );
    } catch (e) {
      rethrow;
    }
  }
}
