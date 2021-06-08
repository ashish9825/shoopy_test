class ProductItem {
  final String displayName;
  final String thumbnail;
  final String catName;
  final double mrp;
  final double salePrice;

  ProductItem.fromJson(Map<String, dynamic> json)
      : displayName = json['display_name'],
        thumbnail = json['thumbnail'] ?? "",
        catName = json['cat_name'] ?? 'No Category',
        mrp = json['mrp'],
        salePrice = json['sale_price'];
}

class Products {
  final List<ProductItem> products;
  final String error;

  Products.fromJson(Map<String, dynamic> json)
      : products = (json['payload']['content'] as List)
            .map((product) => ProductItem.fromJson(product))
            .toList(),
        error = "";

  Products.withError(String errorValue)
      : products = [],
        error = errorValue;
}
