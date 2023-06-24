import 'package:equatable/equatable.dart';
import 'package:wings_shop/data/datasources/remote/dtos/products/product_dto.dart';

class Product extends Equatable {
  final int id;
  final String code;
  final String name;
  final String imgUrl;
  final int price;
  final String currency;
  final int discount;
  final String dimension;
  final String unit;

  const Product({
    required this.id,
    required this.code,
    required this.name,
    required this.imgUrl,
    required this.price,
    required this.currency,
    required this.discount,
    required this.dimension,
    required this.unit,
  });

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        imgUrl,
        price,
        currency,
        discount,
        dimension,
        unit,
      ];
}

extension ProductDtoExt on ProductDto {
  Product toEntity() {
    return Product(
      id: id ?? 0,
      code: code ?? "N/A",
      name: name ?? "N/A",
      imgUrl: imgUrl ?? "https://picsum.photos/id/1/200/300",
      price: price ?? 0,
      currency: currency ?? "N/A",
      discount: discount ?? 0,
      dimension: dimension ?? "N/A",
      unit: unit ?? "N/A",
    );
  }
}
