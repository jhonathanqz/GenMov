import 'package:flutter_modular/flutter_modular.dart';

import 'data/helper/database_helper.dart';
import 'data/provider/database_provider_impl.dart';
import 'domain/repositories/database_repository.dart';
import 'domain/usecase/database/bulk_insert_usecase.dart';
import 'domain/usecase/database/delete_usecase.dart';
import 'domain/usecase/database/insert_usecase.dart';
import 'domain/usecase/database/query_usecase.dart';
import 'domain/usecase/database/raw_query_usecase.dart';
import 'domain/usecase/database/update_usecase.dart';
import 'infrastructure/repositories/contracts/database_provider.dart';
import 'infrastructure/repositories/database_repository_impl.dart';
import 'presentation/controller/database_controller.dart';

abstract class LocalStorageBinds {
  static List<Bind> providers() {
    return [
      Bind.lazySingleton<DatabaseHelper>((i) => DatabaseHelper(), export: true),
      Bind.lazySingleton<DatabaseProvider>(
        (i) => DatabaseProviderImpl(databaseHelper: i()),
        export: true,
      ),
    ];
  }

  static List<Bind> repositories() {
    return [
      Bind.factory<DatabaseRepository>(
        (i) => DatabaseRepositoryImpl(
          databaseProvider: i.get(),
        ),
        export: true,
      ),
    ];
  }

  static List<Bind> usecases() {
    return [
      //SQFLite
      Bind.factory<InsertUseCase>(
        (i) => InsertUseCase(
          databaseRepository: i.get(),
        ),
        export: true,
      ),
      Bind.factory<DeleteUseCase>(
        (i) => DeleteUseCase(
          databaseRepository: i.get(),
        ),
        export: true,
      ),

      Bind.factory<UpdateUseCase>(
        (i) => UpdateUseCase(
          databaseRepository: i.get(),
        ),
        export: true,
      ),
      Bind.factory<QueryUseCase>(
        (i) => QueryUseCase(
          databaseRepository: i.get(),
        ),
        export: true,
      ),
      Bind.factory<RawQueryUsecase>(
        (i) => RawQueryUsecase(
          databaseRepository: i.get(),
        ),
        export: true,
      ),

      Bind.factory<BulkInsertUsecase>(
        (i) => BulkInsertUsecase(
          databaseRepository: i.get(),
        ),
        export: true,
      ),
    ];
  }

  static List<Bind> stores() {
    return [];
  }

  static List<Bind> controllers() {
    return [
      Bind.singleton<DatabaseController>(
        (i) => DatabaseController(
          insertUseCase: i.get(),
          deleteUseCase: i.get(),
          updateUseCase: i.get(),
          queryUseCase: i.get(),
          rawQueryUsecase: i.get(),
          bulkInsertUsecase: i.get(),
        ),
        export: true,
      ),
    ];
  }

  static List<Bind> getBinds() {
    return [
      ...providers(),
      ...repositories(),
      ...usecases(),
      ...stores(),
      ...controllers(),
    ];
  }
}
