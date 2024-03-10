import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  final List<Product> data;

  ProductResponse({
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@JsonSerializable()
class Product {
  final int id;
  final String name;

  final String description;

  @JsonKey(name: "ProductVariations")
  final List<ProductVariations>? productVariations;
  @JsonKey(name: "Brands")
  final Brand? brands;

  Product({
    required this.id,
    required this.name,
    required this.description,
    this.productVariations,
    this.brands,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@JsonSerializable()
class ProductVariations {
  final int? id;
  final int? productId;
  final int? quantity;
  final bool? isDefault;
  final double? price;

  @JsonKey(name: "ProductVarientImages")
  final List<ProductVarientImages>? productVarientImages;

  ProductVariations({
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.isDefault,
    this.productVarientImages,
  });

  factory ProductVariations.fromJson(Map<String, dynamic> json) =>
      _$ProductVariationsFromJson(json);
}

@JsonSerializable()
class ProductVarientImages {
  final int? id;
  @JsonKey(name: "image_path")
  final String? imagePath;
  @JsonKey(name: "product_varient_id")
  final int? productVarientId;

  ProductVarientImages({
    this.id,
    this.imagePath,
    this.productVarientId,
  });

  factory ProductVarientImages.fromJson(Map<String, dynamic> json) =>
      _$ProductVarientImagesFromJson(json);
}

@JsonSerializable()
class Brand {
  final int? id;

  @JsonKey(name: "brand_name")
  final String? brandName;
  @JsonKey(name: "brand_id")
  final int? brandId;

  Brand({
    this.id,
    this.brandName,
    this.brandId,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}
