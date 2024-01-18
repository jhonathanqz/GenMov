import '../helper/database_strings.dart';

abstract class MigrationScript {
  static const migrationProductsRepositionConfirmedTableScript =
      'ALTER TABLE ${DatabaseStrings.productsRepositionConfirmedTable} ADD COLUMN repositionId INTEGER';

  static const migrationRepositionItensScript =
      'ALTER TABLE ${DatabaseStrings.repositionItensRemoteTable} ADD COLUMN repositionId INTEGER';
}
