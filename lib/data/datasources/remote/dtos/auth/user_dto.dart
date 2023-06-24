
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: "email_verified_at")
  DateTime? emailVerifiedAt;
  String? role;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  UserDto({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}