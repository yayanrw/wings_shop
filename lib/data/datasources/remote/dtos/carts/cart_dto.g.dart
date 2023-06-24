// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDto _$CartDtoFromJson(Map<String, dynamic> json) => CartDto(
      userId: json['userId'] as int?,
      productCode: json['product_code'] as String?,
      price: json['price'] as String?,
      quantity: json['quantity'] as String?,
      unit: json['unit'] as String?,
      subTotal: json['sub_total'] as int?,
      currency: json['currency'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CartDtoToJson(CartDto instance) => <String, dynamic>{
      'userId': instance.userId,
      'product_code': instance.productCode,
      'price': instance.price,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'sub_total': instance.subTotal,
      'currency': instance.currency,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
