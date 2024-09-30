class ProductsOfCategoryModel {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  ProductsOfCategoryModel({this.products, this.total, this.skip, this.limit});

  factory ProductsOfCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductsOfCategoryModel(
      products: json['products'] != null
          ? List<Product>.from(json['products'].map((product) => Product.fromJson(product)))
          : null,
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );
  }
}

class Product {
  int? id;
  String? title;
  String? category;
  String? thumbnail;
  double? price;

  Product({this.id, this.title, this.category, this.thumbnail, this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      thumbnail: json['thumbnail'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );
  }
}

