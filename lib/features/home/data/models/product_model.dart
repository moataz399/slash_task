// import 'package:json_annotation/json_annotation.dart';
//
// part 'product_model.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class ProductResponse {
//   final int statusCode;
//   final String message;
//
//   @JsonKey(nullable: true)
//   final Pagination pagination;
//
//   @JsonKey(nullable: true)
//   final List<Product> data;
//
//   ProductResponse({
//     required this.statusCode,
//     required this.message,
//     required this.pagination,
//     required this.data,
//   });
//
//   factory ProductResponse.fromJson(Map<String, dynamic> json) =>
//       _$ProductResponseFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class Pagination {
//   final int pages;
//   final int limit;
//
//   Pagination({
//     required this.pages,
//     required this.limit,
//   });
//
//   factory Pagination.fromJson(Map<String, dynamic> json) =>
//       _$PaginationFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PaginationToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class Product {
//   final int id;
//   final String name;
//   final String type;
//   final String description;
//
//   @JsonKey(nullable: true)
//   final List<ProductVariations> productVariations;
//
//   Product({
//     required this.id,
//     required this.name,
//     required this.type,
//     required this.description,
//     required this.productVariations,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) =>
//       _$ProductFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ProductToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class ProductVariations {
//   final int id;
//   final int productId;
//   final double price;
//   final int quantity;
//   final bool isDefault;
//
//   @JsonKey(nullable: true)
//   final List<ProductVarientImages> productVarientImages;
//
//   ProductVariations({
//     required this.id,
//     required this.productId,
//     required this.price,
//     required this.quantity,
//     required this.isDefault,
//     required this.productVarientImages,
//   });
//
//   factory ProductVariations.fromJson(Map<String, dynamic> json) =>
//       _$ProductVariationsFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ProductVariationsToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class ProductVarientImages {
//   final int id;
//   final String image;
//   final int productVarientId;
//
//   ProductVarientImages({
//     required this.id,
//     required this.image,
//     required this.productVarientId,
//   });
//
//   factory ProductVarientImages.fromJson(Map<String, dynamic> json) =>
//       _$ProductVarientImagesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ProductVarientImagesToJson(this);
// }
