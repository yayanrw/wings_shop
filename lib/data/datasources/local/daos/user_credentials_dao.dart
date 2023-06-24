import 'package:json_annotation/json_annotation.dart';

part 'user_credentials_dao.g.dart';

@JsonSerializable()
class UserCredentialsDao {
  int id;
  String name;
  String email;
  String token;

  UserCredentialsDao({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory UserCredentialsDao.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialsDaoFromJson(json);

  Map<String, dynamic> toJson() => _$UserCredentialsDaoToJson(this);
}