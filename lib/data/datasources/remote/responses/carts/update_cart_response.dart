import 'package:json_annotation/json_annotation.dart';

part 'update_cart_response.g.dart';

@JsonSerializable()
class UpdateCartResponse {
  bool status;
  String? message;

  UpdateCartResponse({
    required this.status,
    this.message,
  });

  factory UpdateCartResponse.fromJson(Map<String, dynamic> json) => _$UpdateCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartResponseToJson(this);
}