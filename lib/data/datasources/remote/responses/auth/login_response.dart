import 'package:json_annotation/json_annotation.dart';
import 'package:wings_shop/data/datasources/remote/dtos/auth/login_data_dto.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  bool status;
  String? message;
  LoginDataDto? data;

  LoginResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}