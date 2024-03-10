import 'package:json_annotation/json_annotation.dart';

part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse {
  final ProductDetailsModel data;

  ProductDetailsResponse({
    required this.data,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);
}

@JsonSerializable()
class ProductDetailsModel {
  final int id;
  final String name;

  final String description;

  @JsonKey(name: "variations")
  final List<Variations>? variations;
  @JsonKey(name: "avaiableProperties")
  final List<AvailableProperties>? availableProperties;

  ProductDetailsModel({
    required this.id,
    required this.name,
    required this.description,
    this.variations,
    this.availableProperties

  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
}

@JsonSerializable()
class AvailableProperties {
  final String property;
  final List<PropertyValue> values;

  AvailableProperties({required this.property, required this.values});

  factory AvailableProperties.fromJson(Map<String, dynamic> json) =>
      _$AvailablePropertiesFromJson(json);
}

@JsonSerializable()
class PropertyValue {
  final String value;
  final int id;

  PropertyValue({required this.value, required this.id});

  factory PropertyValue.fromJson(Map<String, dynamic> json) =>
      _$PropertyValueFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyValueToJson(this);
}

@JsonSerializable()
class Variations {
  final int? id;
  final int? productId;
  final int? quantity;
  final bool? isDefault;
  final double? price;

  @JsonKey(name: "ProductVarientImages")
  final List<ProductVarientImages>? productVarientImages;

  @JsonKey(name: "productPropertiesValues")
  final List<ProductPropertiesValues>? productPropertiesValues;

  Variations(
      {this.id,
      this.productId,
      this.price,
      this.quantity,
      this.isDefault,
      this.productVarientImages,
      this.productPropertiesValues});

  factory Variations.fromJson(Map<String, dynamic> json) =>
      _$VariationsFromJson(json);
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
class ProductPropertiesValues {
  final String? value;
  final String? property;

  ProductPropertiesValues({this.value, this.property});

  factory ProductPropertiesValues.fromJson(Map<String, dynamic> json) =>
      _$ProductPropertiesValuesFromJson(json);
}

@JsonSerializable()
class ProductProperty {
  final String property;
  final List<ProductPropertiesValues> values;

  ProductProperty({required this.property, required this.values});

  factory ProductProperty.fromJson(Map<String, dynamic> json) =>
      _$ProductPropertyFromJson(json);
}
