
import 'package:json_annotation/json_annotation.dart';

part 'logout_response.g.dart';

@JsonSerializable()
class LogoutResponse {
  bool status;
  String? message;
  dynamic? data;

  LogoutResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) => _$LogoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}