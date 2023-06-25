import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/utils/errors/exceptions.dart';
import 'package:wings_shop/core/utils/network_helper.dart';
import 'package:wings_shop/data/datasources/remote/params/cart_params.dart';
import 'package:wings_shop/data/datasources/remote/responses/carts/add_cart_response.dart';
import 'package:wings_shop/data/datasources/remote/responses/carts/carts_response.dart';
import 'package:wings_shop/data/datasources/remote/responses/carts/delete_cart_response.dart';
import 'package:wings_shop/data/datasources/remote/responses/carts/update_cart_response.dart';
import 'package:wings_shop/domain/usescases/user_credentials/get_token.dart';

abstract class CartDataSource {
  Future<CartsResponse> fetchCarts();

  Future<AddCartResponse> addCart(CartParams cartParams);

  Future<UpdateCartResponse> updateCart({
    required int id,
    required int quantity,
  });

  Future<DeleteCartResponse> deleteCart(int id);
}

@LazySingleton(as: CartDataSource)
class CartDataSourceImpl implements CartDataSource {
  final http.Client client;
  final GetToken getToken;

  CartDataSourceImpl(this.client, this.getToken);

  @override
  Future<AddCartResponse> addCart(CartParams cartParams) async {
    final response = await client.post(
      Uri.parse('$baseUrl/carts'),
      headers: NetworkHelper.headerWithToken(await getToken.exec()),
      body: {
        'product_code': cartParams.productCode,
        'price': cartParams.price,
        'quantity': cartParams.quantity,
        'unit': cartParams.unit,
        'currency': cartParams.currency,
      },
    );

    if (response.statusCode == 200) {
      final AddCartResponse addCartResponse =
          AddCartResponse.fromJson(jsonDecode(response.body));
      return addCartResponse;
    } else {
      NetworkHelper.throwExceptionIfClientError(response);
      throw ServerException();
    }
  }

  @override
  Future<DeleteCartResponse> deleteCart(int id) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/carts/$id'),
      headers: NetworkHelper.headerWithToken(await getToken.exec()),
    );

    if (response.statusCode == 200) {
      final DeleteCartResponse deleteCartResponse =
          DeleteCartResponse.fromJson(jsonDecode(response.body));
      return deleteCartResponse;
    } else {
      NetworkHelper.throwExceptionIfClientError(response);
      throw ServerException();
    }
  }

  @override
  Future<CartsResponse> fetchCarts() async {
    final response = await client.get(
      Uri.parse('$baseUrl/carts'),
      headers: NetworkHelper.headerWithToken(await getToken.exec()),
    );
    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      final CartsResponse cartsResponse =
          CartsResponse.fromJson(jsonDecode(response.body));
      return cartsResponse;
    } else {
      NetworkHelper.throwExceptionIfClientError(response);
      throw ServerException();
    }
  }

  @override
  Future<UpdateCartResponse> updateCart({
    required int id,
    required int quantity,
  }) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/carts/$id'),
      headers: NetworkHelper.headerWithToken(await getToken.exec()),
    );

    if (response.statusCode == 200) {
      final UpdateCartResponse updateCartResponse =
          UpdateCartResponse.fromJson(jsonDecode(response.body));
      return updateCartResponse;
    } else {
      NetworkHelper.throwExceptionIfClientError(response);
      throw ServerException();
    }
  }
}
