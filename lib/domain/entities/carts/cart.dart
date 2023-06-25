import 'package:equatable/equatable.dart';
import 'package:wings_shop/data/datasources/remote/dtos/carts/cart_dto.dart';
import 'package:wings_shop/data/datasources/remote/params/cart_params.dart';
import 'package:wings_shop/domain/entities/products/product.dart';

class Cart extends Equatable {
  final int userId;
  final String productCode;
  final int price;
  final int quantity;
  final String unit;
  final int subTotal;
  final String currency;
  final int id;
  final Product product;

  const Cart({
    required this.userId,
    required this.productCode,
    required this.price,
    required this.quantity,
    required this.unit,
    required this.subTotal,
    required this.currency,
    required this.id,
    required this.product,
  });

  @override
  List<Object?> get props => [
        userId,
        productCode,
        price,
        quantity,
        unit,
        subTotal,
        currency,
        id,
        product,
      ];
}

extension CartDtoExt on CartDto {
  Cart toEntity() {
    return Cart(
        userId: userId ?? 0,
        productCode: productCode ?? "N/A",
        price: price ?? 0,
        quantity: quantity ?? 0,
        unit: unit ?? "N/A",
        subTotal: subTotal ?? 0,
        currency: currency ?? "N/A",
        id: id ?? 0,
        product: product?.toEntity() ??
            const Product(
              id: 0,
              code: "N/A",
              name: "N/A",
              imgUrl: "N/A",
              price: 0,
              currency: "N/A",
              discount: 0,
              dimension: "N/A",
              unit: "N/A",
            ));
  }
}

extension CartExt on Cart {
  CartParams toParams() {
    return CartParams(
      productCode: productCode,
      price: price.toString(),
      quantity: quantity.toString(),
      unit: unit,
      currency: currency,
    );
  }
}
