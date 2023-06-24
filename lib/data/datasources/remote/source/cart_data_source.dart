import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/utils/errors/exceptions.dart';
import 'package:wings_shop/core/utils/network_helper.dart';
import 'package:wings_shop/data/datasources/remote/dtos/carts/cart_dto.dart';
import 'package:wings_shop/data/datasources/remote/responses/carts/add_cart_response.dart';
import 'package:wings_shop/data/datasources/remote/responses/carts/carts_response.dart';
import 'package:wings_shop/data/datasources/remote/responses/carts/delete_cart_response.dart';
import 'package:wings_shop/data/datasources/remote/responses/carts/update_cart_response.dart';

abstract class CartDataSource {
  Future<CartsResponse> fetchCarts();

  Future<AddCartResponse> addCart(CartDto cartDto);

  Future<UpdateCartResponse> updateCart({
    required int id,
    required int quantity,
  });

  Future<DeleteCartResponse> deleteCart(int id);
}

@LazySingleton(as: CartDataSource)
class CartDataSourceImpl implements CartDataSource {
  final http.Client client;

  CartDataSourceImpl(this.client);

  @override
  Future<AddCartResponse> addCart(CartDto cartDto) async {
    final response = await client.post(
      Uri.parse('$baseUrl/carts'),
      headers: headerWithToken(),
      body: jsonEncode(cartDto),
    );

    if (response.statusCode == 200) {
      final AddCartResponse addCartResponse =
          AddCartResponse.fromJson(jsonDecode(response.body));
      return addCartResponse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DeleteCartResponse> deleteCart(int id) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/carts/$id'),
      headers: headerWithToken(),
    );

    if (response.statusCode == 200) {
      final DeleteCartResponse deleteCartResponse =
          DeleteCartResponse.fromJson(jsonDecode(response.body));
      return deleteCartResponse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CartsResponse> fetchCarts() async {
    final response = await client.get(
      Uri.parse('$baseUrl/carts'),
      headers: headerWithToken(),
    );

    if (response.statusCode == 200) {
      final CartsResponse cartsResponse =
          CartsResponse.fromJson(jsonDecode(response.body));
      return cartsResponse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UpdateCartResponse> updateCart({
    required int id,
    required int quantity,
  }) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/cart/$id'),
      headers: headerWithToken(),
    );

    if (response.statusCode == 200) {
      final UpdateCartResponse updateCartResponse =
          UpdateCartResponse.fromJson(jsonDecode(response.body));
      return updateCartResponse;
    } else {
      throw ServerException();
    }
  }
}