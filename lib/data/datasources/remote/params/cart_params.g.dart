// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartParams _$CartParamsFromJson(Map<String, dynamic> json) => CartParams(
      productCode: json['productCode'] as String,
      price: json['price'] as String,
      quantity: json['quantity'] as String,
      unit: json['unit'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$CartParamsToJson(CartParams instance) =>
    <String, dynamic>{
      'productCode': instance.productCode,
      'price': instance.price,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'currency': instance.currency,
    };
