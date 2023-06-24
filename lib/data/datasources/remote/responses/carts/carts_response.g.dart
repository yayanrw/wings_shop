// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartsResponse _$CartsResponseFromJson(Map<String, dynamic> json) =>
    CartsResponse(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CartDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartsResponseToJson(CartsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
