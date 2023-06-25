import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/core/utils/network_helper.dart';
import 'package:wings_shop/data/datasources/remote/source/cart_data_source.dart';
import 'package:wings_shop/domain/entities/carts/cart.dart';
import 'package:wings_shop/domain/entities/products/product.dart';
import 'package:wings_shop/domain/repositories/cart_repository.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartDataSource cartDataSource;

  CartRepositoryImpl(this.cartDataSource);

  @override
  Future<Either<Failure, bool>> addCart(Product product) async {
    return NetworkHelper.executeSafely<bool>(() async {
      final response = await cartDataSource.addCart(product.toParams());

      return response.status;
    });
  }

  @override
  Future<Either<Failure, bool>> deleteCart(int id) async {
    return NetworkHelper.executeSafely<bool>(() async {
      final response = await cartDataSource.deleteCart(id);

      return response.status;
    });
  }

  @override
  Future<Either<Failure, List<Cart>>> getCarts() async {
    return NetworkHelper.executeSafely<List<Cart>>(() async {
      final response = await cartDataSource.fetchCarts();

      return response.data!.map((cartDto) => cartDto.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, bool>> updateCart({
    required int id,
    required int quantity,
  }) async {
    return NetworkHelper.executeSafely<bool>(() async {
      final response =
          await cartDataSource.updateCart(id: id, quantity: quantity);

      return response.status;
    });
  }
}
