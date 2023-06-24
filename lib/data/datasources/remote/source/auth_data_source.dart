import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/utils/errors/exceptions.dart';
import 'package:wings_shop/core/utils/network_helper.dart';
import 'package:wings_shop/data/datasources/remote/responses/auth/login_response.dart';
import 'package:wings_shop/data/datasources/remote/responses/auth/logout_response.dart';

abstract class AuthDataSource {
  Future<LoginResponse> fetchLogin();

  Future<LogoutResponse> fetchLogout();
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final http.Client client;

  AuthDataSourceImpl(this.client);

  @override
  Future<LoginResponse> fetchLogin() async {
    final response =
        await client.get(Uri.parse('$baseUrl/login'), headers: defaultHeader());

    if (response.statusCode == 200) {
      final LoginResponse loginResponse =
          LoginResponse.fromJson(jsonDecode(response.body));
      return loginResponse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<LogoutResponse> fetchLogout() async {
    final response = await client.get(Uri.parse('$baseUrl/logout'),
        headers: headerWithToken());

    if (response.statusCode == 200) {
      final LogoutResponse logoutResponse =
          LogoutResponse.fromJson(jsonDecode(response.body));
      return logoutResponse;
    } else {
      throw ServerException();
    }
  }
}