import '../../repositories/database_repository.dart';

class DeleteUseCase {
  final DatabaseRepository databaseRepository;

  DeleteUseCase({
    required this.databaseRepository,
  });

  Future<int> call({
    required String table,
    String? where,
    List<String>? whereArgs,
  }) async {
    try {
      return await databaseRepository.delete(
        table: table,
        where: where,
        whereArgs: whereArgs,
      );
    } catch (e) {
      rethrow;
    }
  }
}
