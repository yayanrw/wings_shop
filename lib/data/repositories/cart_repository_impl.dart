import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/exceptions.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/data/datasources/remote/source/cart_data_source.dart';
import 'package:wings_shop/domain/entities/carts/cart.dart';
import 'package:wings_shop/domain/repositories/cart_repository.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartDataSource cartDataSource;

  CartRepositoryImpl(this.cartDataSource);

  @override
  Future<Either<Failure, bool>> addCart(Cart cart) async {
    try {
      final response = await cartDataSource.addCart(cart.toParams());

      return Right(response.status);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCart(int id) async {
    try {
      final response = await cartDataSource.deleteCart(id);

      return Right(response.status);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }

  @override
  Future<Either<Failure, List<Cart>>> getCarts() async {
    try {
      final response = await cartDataSource.fetchCarts();

      return Right(
          response.data!.map((cartDto) => cartDto.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateCart(
      {required int id, required int quantity}) async {
    try {
      final response =
          await cartDataSource.updateCart(id: id, quantity: quantity);

      return Right(response.status);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }
}
