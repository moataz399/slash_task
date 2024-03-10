// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsResponse _$ProductDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsResponse(
      data: ProductDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsResponseToJson(
        ProductDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      variations: (json['variations'] as List<dynamic>?)
          ?.map((e) => Variations.fromJson(e as Map<String, dynamic>))
          .toList(),
      availableProperties: (json['avaiableProperties'] as List<dynamic>?)
          ?.map((e) => AvailableProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
        ProductDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'variations': instance.variations,
      'avaiableProperties': instance.availableProperties,
    };

AvailableProperties _$AvailablePropertiesFromJson(Map<String, dynamic> json) =>
    AvailableProperties(
      property: json['property'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) => PropertyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailablePropertiesToJson(
        AvailableProperties instance) =>
    <String, dynamic>{
      'property': instance.property,
      'values': instance.values,
    };

PropertyValue _$PropertyValueFromJson(Map<String, dynamic> json) =>
    PropertyValue(
      value: json['value'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$PropertyValueToJson(PropertyValue instance) =>
    <String, dynamic>{
      'value': instance.value,
      'id': instance.id,
    };

Variations _$VariationsFromJson(Map<String, dynamic> json) => Variations(
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      isDefault: json['isDefault'] as bool?,
      productVarientImages: (json['ProductVarientImages'] as List<dynamic>?)
          ?.map((e) => ProductVarientImages.fromJson(e as Map<String, dynamic>))
          .toList(),
      productPropertiesValues:
          (json['productPropertiesValues'] as List<dynamic>?)
              ?.map((e) =>
                  ProductPropertiesValues.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$VariationsToJson(Variations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'isDefault': instance.isDefault,
      'price': instance.price,
      'ProductVarientImages': instance.productVarientImages,
      'productPropertiesValues': instance.productPropertiesValues,
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

ProductPropertiesValues _$ProductPropertiesValuesFromJson(
        Map<String, dynamic> json) =>
    ProductPropertiesValues(
      value: json['value'] as String?,
      property: json['property'] as String?,
    );

Map<String, dynamic> _$ProductPropertiesValuesToJson(
        ProductPropertiesValues instance) =>
    <String, dynamic>{
      'value': instance.value,
      'property': instance.property,
    };

ProductProperty _$ProductPropertyFromJson(Map<String, dynamic> json) =>
    ProductProperty(
      property: json['property'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) =>
              ProductPropertiesValues.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductPropertyToJson(ProductProperty instance) =>
    <String, dynamic>{
      'property': instance.property,
      'values': instance.values,
    };
