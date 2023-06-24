import 'package:json_annotation/json_annotation.dart';

part 'cart_params.g.dart';

@JsonSerializable()
class CartParams {
  String productCode;
  String price;
  String quantity;
  String unit;
  String currency;

  CartParams({
    required this.productCode,
    required this.price,
    required this.quantity,
    required this.unit,
    required this.currency,
  });

  factory CartParams.fromJson(Map<String, dynamic> json) =>
      _$CartParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CartParamsToJson(this);
}
