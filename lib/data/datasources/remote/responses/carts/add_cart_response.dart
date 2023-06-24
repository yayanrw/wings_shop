
import 'package:json_annotation/json_annotation.dart';
import 'package:wings_shop/data/datasources/remote/dtos/carts/cart_dto.dart';

part 'add_cart_response.g.dart';

@JsonSerializable()
class AddCartResponse {
  bool status;
  String? message;
  CartDto? data;

  AddCartResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory AddCartResponse.fromJson(Map<String, dynamic> json) => _$AddCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddCartResponseToJson(this);
}