// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartResponse _$UpdateCartResponseFromJson(Map<String, dynamic> json) =>
    UpdateCartResponse(
      status: json['status'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UpdateCartResponseToJson(UpdateCartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
