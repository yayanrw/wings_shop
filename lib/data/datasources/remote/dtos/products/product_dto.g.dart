// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      imgUrl: json['imgUrl'] as String?,
      price: json['price'] as int?,
      currency: json['currency'] as String?,
      discount: json['discount'] as int?,
      dimension: json['dimension'] as String?,
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
      'price': instance.price,
      'currency': instance.currency,
      'discount': instance.discount,
      'dimension': instance.dimension,
      'unit': instance.unit,
    };
