
import 'package:json_annotation/json_annotation.dart';
import 'package:wings_shop/data/datasources/remote/dtos/carts/cart_dto.dart';

part 'delete_cart_response.g.dart';

@JsonSerializable()
class DeleteCartResponse {
  bool status;
  String? message;
  CartDto? data;

  DeleteCartResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory DeleteCartResponse.fromJson(Map<String, dynamic> json) => _$DeleteCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCartResponseToJson(this);
}