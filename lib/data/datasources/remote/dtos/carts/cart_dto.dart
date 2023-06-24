import 'package:json_annotation/json_annotation.dart';

part 'cart_dto.g.dart';

@JsonSerializable()
class CartDto {
  int? userId;
  @JsonKey(name: "product_code")
  String? productCode;
  String? price;
  String? quantity;
  String? unit;
  @JsonKey(name: "sub_total")
  int? subTotal;
  String? currency;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  int? id;

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
  });

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartDtoToJson(this);
}
