import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/exceptions.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/data/datasources/remote/source/product_data_source.dart';
import 'package:wings_shop/domain/entities/products/product.dart';
import 'package:wings_shop/domain/repositories/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl(this.productDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final response = await productDataSource.fetchProducts();

      return Right(
          response.data!.map((productDto) => productDto.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }
}
