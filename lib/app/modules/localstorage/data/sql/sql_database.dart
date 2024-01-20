abstract class SQL {
  static String searchProductsDescription(String description) => '''
    SELECT 
      ps.id,
      ps.productId,
      ps.companyId,
      ps.description,
      ps.groupId,
      ps.sku,
      ps.imageUrl,
      ps.imageHash,
      ps.groupDescription,
      ps.imageGroupUrl,
      ps.isInactive,
      ps.availableQuantity,
      ps.costPrice,
      ps.salePrice,
      ps.promotionPrice,
      ps.availableQuantityDistributionCenter,
      ps.idealQuantity,
      ps.loyalPrice,
      ps.maximumQuantity,
      ps.minimumQuantity,
      ps.supplyQuantity,
      ps.quantityStock,
      ps.differenceQuantity
    FROM 
      ProductsStock ps
    WHERE 
      (ps.sku not in (SELECT psc.sku FROM ProductsStockConfirmed psc))
      AND
      (ps.description LIKE '%$description%')
      AND
      (ps.isInactive = ?)
    ORDER BY 
      ps.description ASC
  ''';

  static String searchDescriptionOrSku(String description, String sku) => '''
    SELECT 
      ps.id,
      ps.productId,
      ps.companyId,
      ps.description,
      ps.groupId,
      ps.sku,
      ps.imageUrl,
      ps.imageHash,
      ps.groupDescription,
      ps.imageGroupUrl,
      ps.isInactive,
      ps.availableQuantity,
      ps.costPrice,
      ps.salePrice,
      ps.promotionPrice,
      ps.availableQuantityDistributionCenter,
      ps.idealQuantity,
      ps.loyalPrice,
      ps.maximumQuantity,
      ps.minimumQuantity,
      ps.supplyQuantity,
      ps.quantityStock,
      ps.differenceQuantity
    FROM 
      ProductsStock ps
    WHERE 
      (ps.sku not in (SELECT psc.sku FROM ProductsStockConfirmed psc))
      AND
      ((ps.description LIKE '%$description%') OR (ps.sku LIKE '%$sku%'))
      AND
      (ps.isInactive = ?)
    ORDER BY 
      ps.description ASC
  ''';

  static String searchProductsSku(String sku) => '''
    SELECT 
      ps.id,
      ps.productId,
      ps.companyId,
      ps.description,
      ps.groupId,
      ps.sku,
      ps.imageUrl,
      ps.imageHash,
      ps.groupDescription,
      ps.imageGroupUrl,
      ps.isInactive,
      ps.availableQuantity,
      ps.costPrice,
      ps.salePrice,
      ps.promotionPrice,
      ps.availableQuantityDistributionCenter,
      ps.idealQuantity,
      ps.loyalPrice,
      ps.maximumQuantity,
      ps.minimumQuantity,
      ps.supplyQuantity,
      ps.quantityStock,
      ps.differenceQuantity
    FROM 
      ProductsStock ps
    WHERE 
      (ps.sku not in (SELECT psc.sku FROM ProductsStockConfirmed psc))
      AND
      (ps.sku LIKE '%$sku%')
      AND
      (ps.isInactive = ?)
    ORDER BY 
      ps.description ASC
  ''';

  static String searchFullProducts() => '''
    SELECT 
      ps.id,
      ps.productId,
      ps.companyId,
      ps.description,
      ps.groupId,
      ps.sku,
      ps.imageUrl,
      ps.imageHash,
      ps.groupDescription,
      ps.imageGroupUrl,
      ps.isInactive,
      ps.availableQuantity,
      ps.costPrice,
      ps.salePrice,
      ps.promotionPrice,
      ps.availableQuantityDistributionCenter,
      ps.idealQuantity,
      ps.loyalPrice,
      ps.maximumQuantity,
      ps.minimumQuantity,
      ps.supplyQuantity,
      ps.quantityStock,
      ps.differenceQuantity
    FROM 
      ProductsStock ps
    WHERE 
      (ps.sku not in (SELECT psc.sku FROM ProductsStockConfirmed psc))
      AND
      (ps.isInactive = ?)
    ORDER BY 
      ps.description ASC
  ''';

  static String getItensRepositionConfirmed() => '''
    SELECT 
      rir.id,
      rir.barcode,
      rir.description,
      rir.imageUrl,
      rir.category,
      rir.categoryId,
      rir.unityType,
      rir.price,
      rir.costPrice,
      rir.promotionPrice,
      rir.siteId,
      rir.companyId,
      rir.availableQuantity,
      rir.quantity,
      rir.netValue,
      rir.subtotal,
      rir.loyalPrice,
      rir.discount,
      rir.minimumQuantity,
      rir.maximumQuantity,
      rir.idealQuantity,
      rir.availableQuantityDistributionCenter,
      rir.supplyQuantity,
      rir.productIdDB,
      rir.newQuantity,
      rir.isConfirmed,
      rir.isInactive,
      rir.productSiteId,
      rir.isEdit,
      rir.repositionId
    FROM 
      RepositionItensRemote rir
    WHERE 
      (rir.barcode not in (SELECT prc.sku FROM ProductsRepositionConfirmed prc))
    AND
      (rir.repositionId = ?)
    ORDER BY 
      rir.description ASC
  ''';

  static String checkExistsProductReposition() => '''
    SELECT 
      rir.id,
      rir.barcode,
      rir.description,
      rir.imageUrl,
      rir.category,
      rir.categoryId,
      rir.unityType,
      rir.price,
      rir.costPrice,
      rir.promotionPrice,
      rir.siteId,
      rir.companyId,
      rir.availableQuantity,
      rir.quantity,
      rir.netValue,
      rir.subtotal,
      rir.loyalPrice,
      rir.discount,
      rir.minimumQuantity,
      rir.maximumQuantity,
      rir.idealQuantity,
      rir.availableQuantityDistributionCenter,
      rir.supplyQuantity,
      rir.productIdDB,
      rir.newQuantity,
      rir.isConfirmed,
      rir.isInactive,
      rir.productSiteId,
      rir.isEdit,
      rir.repositionId
    FROM 
      RepositionItensRemote rir
    WHERE 
      (rir.repositionId = ?)
    ORDER BY 
      rir.description ASC
  ''';
}
