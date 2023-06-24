import 'package:json_annotation/json_annotation.dart';
import 'package:wings_shop/data/datasources/remote/dtos/carts/cart_dto.dart';

part 'carts_response.g.dart';

@JsonSerializable()
class CartsResponse {
  bool status;
  String? message;
  List<CartDto>? data;

  CartsResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory CartsResponse.fromJson(Map<String, dynamic> json) => _$CartsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartsResponseToJson(this);
}