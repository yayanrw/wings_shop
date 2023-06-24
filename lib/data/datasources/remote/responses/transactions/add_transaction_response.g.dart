// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTransactionResponse _$AddTransactionResponseFromJson(
        Map<String, dynamic> json) =>
    AddTransactionResponse(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$AddTransactionResponseToJson(
        AddTransactionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
