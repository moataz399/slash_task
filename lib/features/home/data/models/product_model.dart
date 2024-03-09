class ProductModelResponse {
  final int statusCode;
  final String message;
  final Pagination pagination;
  final List<Product> data;

  ProductModelResponse({
    required this.statusCode,
    required this.message,
    required this.pagination,
    required this.data,
  });

  factory ProductModelResponse.fromJson(Map<String, dynamic> json) {
    return ProductModelResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      pagination: Pagination.fromJson(json['pagination']),
      data: List<Product>.from(json['data'].map((x) => Product.fromJson(x))),
    );
  }
}

class Pagination {
  int pages;
  int limit;

  Pagination({
    required this.pages,
    required this.limit,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      pages: json['pages'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pages': pages,
      'limit': limit,
    };
  }
}

class Product {
  final int id;
  final String name;
  final String description;

  final List<ProductVariation>? productVariations;

  Product({
    required this.id,
    required this.name,
    required this.description,
    this.productVariations,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      productVariations: List<ProductVariation>.from(
          json['ProductVariations'].map((x) => ProductVariation.fromJson(x))),
      // Parse and initialize other fields
    );
  }
}

class ProductVariation {
  final int id;
  final int productId;
  final double price;
  final int quantity;
  final bool isDefault;
  final List<ProductVariantImage>? productVariantImages;

  ProductVariation({
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.isDefault,
    required this.productVariantImages,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) {
    return ProductVariation(
      id: json['id'],
      productId: json['product_id'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      isDefault: json['is_default'],
      productVariantImages: List<ProductVariantImage>.from(
        json['ProductVarientImages']
            .map((x) => ProductVariantImage.fromJson(x)),
      ),
    );
  }

}

class ProductVariantImage {
  final int? id;
  final String? imagePath;
  final int? productVariantId;

  ProductVariantImage({
     this.id,
     this.imagePath,
     this.productVariantId,
  });

  factory ProductVariantImage.fromJson(Map<String, dynamic> json) {
    return ProductVariantImage(
      id: json['id'],
      imagePath: json['image_path'],
      productVariantId: json['product_varient_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_path': imagePath,
      'product_varient_id': productVariantId,
    };
  }
}
