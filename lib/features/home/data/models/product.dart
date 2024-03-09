import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

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

  Product({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

// @JsonSerializable()
// class ProductVariations {
//   final int id;
//   final int productId;
//   final double price;
//   final int quantity;
//   final int? warehouseId;
//   final bool isDefault;
//   final String? deletedAt;
//   final String createdAt;
//   final String updatedAt;
//   final int productVariationStatusId;
//   final String? acceptedBy;
//
//   final List<ProductVarientImages> productVarientImages;
//
//   ProductVariations({
//     required this.id,
//     required this.productId,
//     required this.price,
//     required this.quantity,
//     required this.warehouseId,
//     required this.isDefault,
//     required this.deletedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.productVariationStatusId,
//     required this.acceptedBy,
//     required this.productVarientImages,
//   });
//
//   factory ProductVariations.fromJson(Map<String, dynamic> json) =>
//       _$ProductVariationsFromJson(json);
// }

// @JsonSerializable()
// class ProductVarientImages {
//   final int id;
//   final String imagePath;
//   final int productVarientId;
//   final String createdAt;
//   final String updatedAt;
//
//   ProductVarientImages({
//     required this.id,
//     required this.imagePath,
//     required this.productVarientId,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory ProductVarientImages.fromJson(Map<String, dynamic> json) =>
//       _$ProductVarientImagesFromJson(json);
//
