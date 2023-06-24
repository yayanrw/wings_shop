// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCartResponse _$DeleteCartResponseFromJson(Map<String, dynamic> json) =>
    DeleteCartResponse(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CartDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeleteCartResponseToJson(DeleteCartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
