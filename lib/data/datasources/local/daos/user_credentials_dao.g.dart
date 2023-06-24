// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credentials_dao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCredentialsDao _$UserCredentialsDaoFromJson(Map<String, dynamic> json) =>
    UserCredentialsDao(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserCredentialsDaoToJson(UserCredentialsDao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'token': instance.token,
    };
