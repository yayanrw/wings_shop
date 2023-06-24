import 'package:json_annotation/json_annotation.dart';
import 'package:wings_shop/data/datasources/remote/dtos/carts/cart_dto.dart';

part 'update_cart_response.g.dart';

@JsonSerializable()
class UpdateCartResponse {
  bool status;
  String? message;
  CartDto? data;

  UpdateCartResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory UpdateCartResponse.fromJson(Map<String, dynamic> json) => _$UpdateCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartResponseToJson(this);
}