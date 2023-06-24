import 'package:json_annotation/json_annotation.dart';

part 'cart_dto.g.dart';

@JsonSerializable()
class CartDto {
  int? userId;
  String? productCode;
  String? price;
  String? quantity;
  String? unit;
  int? subTotal;
  String? currency;
  DateTime? updatedAt;
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
