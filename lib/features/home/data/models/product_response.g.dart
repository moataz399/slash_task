// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      productVariations: (json['ProductVariations'] as List<dynamic>?)
          ?.map((e) => ProductVariations.fromJson(e as Map<String, dynamic>))
          .toList(),
      brands: json['Brands'] == null
          ? null
          : Brand.fromJson(json['Brands'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ProductVariations': instance.productVariations,
      'Brands': instance.brands,
    };

ProductVariations _$ProductVariationsFromJson(Map<String, dynamic> json) =>
    ProductVariations(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      isDefault: json['isDefault'] as bool?,
      productVarientImages: (json['ProductVarientImages'] as List<dynamic>?)
          ?.map((e) => ProductVarientImages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductVariationsToJson(ProductVariations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'isDefault': instance.isDefault,
      'price': instance.price,
      'ProductVarientImages': instance.productVarientImages,
    };

ProductVarientImages _$ProductVarientImagesFromJson(
        Map<String, dynamic> json) =>
    ProductVarientImages(
      id: json['id'] as int?,
      imagePath: json['image_path'] as String?,
      productVarientId: json['product_varient_id'] as int?,
    );

Map<String, dynamic> _$ProductVarientImagesToJson(
        ProductVarientImages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_path': instance.imagePath,
      'product_varient_id': instance.productVarientId,
    };

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: json['id'] as int?,
      brandName: json['brand_name'] as String?,
      brandId: json['brand_id'] as int?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'brand_name': instance.brandName,
      'brand_id': instance.brandId,
    };
