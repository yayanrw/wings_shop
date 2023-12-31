import 'package:dartz/dartz.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/domain/entities/carts/cart.dart';
import 'package:wings_shop/domain/entities/products/product.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> getCarts();

  Future<Either<Failure, bool>> addCart(Product product);

  Future<Either<Failure, bool>> updateCart({
    required int id,
    required int quantity,
  });

  Future<Either<Failure, bool>> deleteCart(int id);
}
