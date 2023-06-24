import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/utils/errors/exceptions.dart';
import 'package:wings_shop/core/utils/network_helper.dart';
import 'package:wings_shop/data/datasources/remote/responses/products/products_response.dart';

abstract class ProductDataSource {
  Future<ProductsResponse> fetchProducts();
}

@LazySingleton(as: ProductDataSource)
class ProductDataSourceImpl implements ProductDataSource {
  final http.Client client;

  ProductDataSourceImpl(this.client);

  @override
  Future<ProductsResponse> fetchProducts() async {
    final response = await client.get(Uri.parse('$baseUrl/login'),
        headers: headerWithToken());

    if (response.statusCode == 200) {
      final ProductsResponse productsResponse =
          ProductsResponse.fromJson(jsonDecode(response.body));
      return productsResponse;
    } else {
      throw ServerException();
    }
  }
}
