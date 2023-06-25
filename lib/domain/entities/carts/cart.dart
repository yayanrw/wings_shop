import 'package:equatable/equatable.dart';
import 'package:wings_shop/data/datasources/remote/dtos/carts/cart_dto.dart';
import 'package:wings_shop/data/datasources/remote/params/cart_params.dart';

class Cart extends Equatable {
  final int userId;
  final String productCode;
  final String price;
  final String quantity;
  final String unit;
  final int subTotal;
  final String currency;
  final int id;

  const Cart({
    required this.userId,
    required this.productCode,
    required this.price,
    required this.quantity,
    required this.unit,
    required this.subTotal,
    required this.currency,
    required this.id,
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
      ];
}

extension CartDtoExt on CartDto {
  Cart toEntity() {
    return Cart(
      userId: userId ?? 0,
      productCode: productCode ?? "N/A",
      price: price ?? "N/A",
      quantity: quantity ?? "N/A",
      unit: unit ?? "N/A",
      subTotal: subTotal ?? 0,
      currency: currency ?? "N/A",
      id: id ?? 0,
    );
  }
}

extension CartExt on Cart {
  CartParams toParams() {
    return CartParams(
      productCode: productCode,
      price: price,
      quantity: quantity,
      unit: unit,
      currency: currency,
    );
  }
}
