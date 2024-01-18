import '../helper/database_strings.dart';

abstract class DatabaseScript {
  static const settingsTableScript =
      'CREATE TABLE IF NOT EXISTS ${DatabaseStrings.settingsTable} (id INTEGER PRIMARY KEY AUTOINCREMENT, host TEXT, port TEXT, token TEXT)';

  static const productsStockTableScript = '''
      CREATE TABLE IF NOT EXISTS ${DatabaseStrings.productsStockTable} 
      (id INTEGER PRIMARY KEY AUTOINCREMENT, 
      productId INTEGER,
      companyId INTEGER,
      description TEXT,
      groupId INTEGER,
      sku TEXT,
      imageUrl TEXT,
      imageHash TEXT,
      groupDescription TEXT,
      imageGroupUrl TEXT,
      isInactive INTEGER,
      availableQuantity REAL,
      costPrice TEXT,
      salePrice TEXT,
      promotionPrice TEXT,
      availableQuantityDistributionCenter REAL,
      idealQuantity REAL,
      loyalPrice TEXT,
      maximumQuantity REAL,
      minimumQuantity REAL,
      supplyQuantity REAL,
      quantityStock REAL,
      differenceQuantity REAL)
      ''';

  static const productsStockConfirmedTableScript = '''
      CREATE TABLE IF NOT EXISTS ${DatabaseStrings.productsStockConfirmedTable} 
      (id INTEGER PRIMARY KEY AUTOINCREMENT, 
      productId INTEGER,
      description TEXT,
      sku TEXT,
      imageUrl TEXT,
      availableQuantity REAL,
      availableQuantityDistributionCenter REAL,
      idealQuantity REAL,
      minimumQuantity REAL,
      maximumQuantity REAL,
      newQuantity REAL,
      isConfirmed INTEGER,
      isInactive INTEGER,
      companyId INTEGER,
      groupId INTEGER,
      imageHash TEXT,
      groupDescription TEXT,
      imageGroupUrl TEXT,
      costPrice TEXT,
      salePrice TEXT,
      promotionPrice TEXT,
      loyalPrice TEXT,
      supplyQuantity REAL,
      quantityStock REAL,
      differenceQuantity REAL)
      ''';

  static const productsRepositionConfirmedTableScript = '''
      CREATE TABLE IF NOT EXISTS ${DatabaseStrings.productsRepositionConfirmedTable} 
      (id INTEGER PRIMARY KEY AUTOINCREMENT, 
      productId INTEGER,
      description TEXT,
      sku TEXT,
      imageUrl TEXT,
      availableQuantity REAL,
      availableQuantityDistributionCenter REAL,
      idealQuantity REAL,
      minimumQuantity REAL,
      maximumQuantity REAL,
      newQuantity REAL,
      isConfirmed INTEGER,
      isInactive INTEGER,
      companyId INTEGER,
      groupId INTEGER,
      imageHash TEXT,
      groupDescription TEXT,
      imageGroupUrl TEXT,
      costPrice TEXT,
      salePrice TEXT,
      promotionPrice TEXT,
      loyalPrice TEXT,
      supplyQuantity REAL,
      quantityStock REAL,
      differenceQuantity REAL,
      repositionId INTEGER)
      ''';

  static const repositionTableScript = '''
        CREATE TABLE IF NOT EXISTS ${DatabaseStrings.repositionTable} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        distributionCenterId INTEGER,
        siteId INTEGER,
        isConfirmed INTEGER)
        ''';

  static const inventoryProductsTableScript = '''
      CREATE TABLE IF NOT EXISTS ${DatabaseStrings.inventoryProductsTable} 
      (id INTEGER PRIMARY KEY AUTOINCREMENT,
      productId INTEGER,
      productSiteId INTEGER,
      name TEXT,
      sku TEXT,
      imageUrl TEXT,
      siteId INTEGER,
      quantity REAL,
      price REAL,
      inventoryId INTEGER)
      ''';

  static const inventoryStockTableScript = '''
      CREATE TABLE IF NOT EXISTS ${DatabaseStrings.inventoryStockTable} 
      (id INTEGER PRIMARY KEY AUTOINCREMENT,
      productId INTEGER,
      name TEXT,
      sku TEXT,
      imageUrl TEXT,
      siteId INTEGER,
      quantity REAL,
      price REAL,
      inventoryId INTEGER,
      productSiteId INTEGER)
      ''';

  static const inventoryTableScript = '''
      CREATE TABLE IF NOT EXISTS ${DatabaseStrings.inventoryTable} 
      (id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      siteId INTEGER,
      siteName TEXT,
      isComplete INTEGER,
      productSiteId INTEGER,
      createdAt TEXT,
      updatedAt TEXT)
      ''';

  static const userTableScript = '''
      CREATE TABLE IF NOT EXISTS ${DatabaseStrings.userTable} 
      (id INTEGER PRIMARY KEY AUTOINCREMENT,
      email TEXT,
      password TEXT)
      ''';

  static const repositionItensRemoteScript = '''
      CREATE TABLE IF NOT EXISTS ${DatabaseStrings.repositionItensRemoteTable} 
      (id INTEGER PRIMARY KEY AUTOINCREMENT,
      barcode TEXT,
      description TEXT,
      imageUrl TEXT,
      category TEXT,
      categoryId INTEGER,
      unityType TEXT,
      price REAL,
      costPrice REAL,
      promotionPrice REAL,
      siteId INTEGER,
      companyId INTEGER,
      availableQuantity REAL,
      quantity REAL,
      netValue REAL,
      subtotal REAL,
      loyalPrice REAL,
      discount REAL,
      minimumQuantity REAL,
      maximumQuantity REAL,
      idealQuantity REAL,
      availableQuantityDistributionCenter REAL,
      supplyQuantity REAL,
      productIdDB INTEGER,
      newQuantity REAL,
      isConfirmed INTEGER,
      isInactive INTEGER,
      productSiteId INTEGER,
      isEdit INTEGER,
      repositionId INTEGER)
''';
}
