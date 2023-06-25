import 'package:json_annotation/json_annotation.dart';
import 'package:wings_shop/data/datasources/remote/dtos/products/product_dto.dart';

part 'cart_dto.g.dart';

@JsonSerializable()
class CartDto {
  int? userId;
  @JsonKey(name: "product_code")
  String? productCode;
  int? price;
  int? quantity;
  String? unit;
  @JsonKey(name: "sub_total")
  int? subTotal;
  String? currency;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  int? id;
  ProductDto? product;

  CartDto({
    this.userId,
    this.productCode,
    this.price,
    this.quantity,
    this.unit,
    this.subTotal,
    this.currency,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.product,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartDtoToJson(this);
}
