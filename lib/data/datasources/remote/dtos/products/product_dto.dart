
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  int? id;
  String? code;
  String? name;
  @JsonKey(name: "img_url")
  String? imgUrl;
  int? price;
  String? currency;
  int? discount;
  String? dimension;
  String? unit;

  ProductDto({
    this.id,
    this.code,
    this.name,
    this.imgUrl,
    this.price,
    this.currency,
    this.discount,
    this.dimension,
    this.unit,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}