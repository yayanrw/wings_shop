// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDto _$CartDtoFromJson(Map<String, dynamic> json) => CartDto(
      userId: json['userId'] as int?,
      productCode: json['productCode'] as String?,
      price: json['price'] as String?,
      quantity: json['quantity'] as String?,
      unit: json['unit'] as String?,
      subTotal: json['subTotal'] as int?,
      currency: json['currency'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CartDtoToJson(CartDto instance) => <String, dynamic>{
      'userId': instance.userId,
      'productCode': instance.productCode,
      'price': instance.price,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'subTotal': instance.subTotal,
      'currency': instance.currency,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
