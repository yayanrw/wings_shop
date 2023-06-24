import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/core/utils/network_helper.dart';
import 'package:wings_shop/data/datasources/remote/source/product_data_source.dart';
import 'package:wings_shop/domain/entities/products/product.dart';
import 'package:wings_shop/domain/repositories/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl(this.productDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    return NetworkHelper.executeSafely<List<Product>>(() async {
      final response = await productDataSource.fetchProducts();

      return response.data!.map((productDto) => productDto.toEntity()).toList();
    });
  }
}
