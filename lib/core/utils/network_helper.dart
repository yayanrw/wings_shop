import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:wings_shop/core/utils/errors/exceptions.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';

Map<String, String> defaultHeader() {
  return {
    'Accept': 'application/json',
    'Content-Type': 'application/x-www-form-urlencoded',
  };
}

Map<String, String> headerWithToken() {
  return {
    'Authorization': 'Bearer ',
    'Accept': 'application/json',
    'Content-Type': 'application/x-www-form-urlencoded',
  };
}

void throwExceptionIfClientError(http.Response response) {
  if (response.statusCode >= 400 && response.statusCode <= 499) {
    final errorResponse = jsonDecode(response.body);
    final message = errorResponse['message'];
    throw ApplicationException(message);
  }
}

Future<Either<Failure, T>> executeSafely<T>(
    Future<T> Function() action) async {
  try {
    final result = await action();
    return Right(result);
  } on ApplicationException catch (e) {
    return Left(ApplicationFailure(e.message));
  } on ServerException catch (e) {
    return Left(ServerFailure(e.toString()));
  } on SocketException {
    return const Left(ConnectionFailure("Connection failed"));
  }
}
