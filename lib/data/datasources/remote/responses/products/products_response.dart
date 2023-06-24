import 'package:json_annotation/json_annotation.dart';
import 'package:wings_shop/data/datasources/remote/dtos/products/product_dto.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  bool status;
  String? message;
  List<ProductDto>? data;

  ProductsResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
