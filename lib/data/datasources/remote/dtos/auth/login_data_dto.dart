import 'package:json_annotation/json_annotation.dart';
import 'package:wings_shop/data/datasources/remote/dtos/auth/user_dto.dart';

part 'login_data_dto.g.dart';

@JsonSerializable()
class LoginDataDto {
  UserDto? user;
  String? token;

  LoginDataDto({
    this.user,
    this.token,
  });

  factory LoginDataDto.fromJson(Map<String, dynamic> json) => _$LoginDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataDtoToJson(this);
}