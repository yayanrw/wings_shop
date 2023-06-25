import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/utils/errors/exceptions.dart';
import 'package:wings_shop/core/utils/network_helper.dart';
import 'package:wings_shop/data/datasources/remote/responses/transactions/add_transaction_response.dart';
import 'package:wings_shop/domain/usescases/user_credentials/get_token.dart';

abstract class TransactionDataSource {
  Future<AddTransactionResponse> createTransaction();
}

@LazySingleton(as: TransactionDataSource)
class TransactionDataSourceImpl implements TransactionDataSource {
  final http.Client client;
  final GetToken getToken;

  TransactionDataSourceImpl(this.client, this.getToken);

  @override
  Future<AddTransactionResponse> createTransaction() async {
    final response = await client.post(
      Uri.parse('$baseUrl/transactions'),
      headers: NetworkHelper.headerWithToken(await getToken.exec()),
    );

    if (response.statusCode == 200) {
      final AddTransactionResponse addTransactionResponse =
          AddTransactionResponse.fromJson(jsonDecode(response.body));
      return addTransactionResponse;
    } else {
      NetworkHelper.throwExceptionIfClientError(response);
      throw ServerException();
    }
  }
}
