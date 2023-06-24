import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/exceptions.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/data/datasources/remote/source/auth_data_source.dart';
import 'package:wings_shop/domain/entities/auth/login_data.dart';
import 'package:wings_shop/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Either<Failure, LoginData>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authDataSource.fetchLogin(
        email: email,
        password: password,
      );

      return Right(response.data!.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }

  @override
  Future<Either<Failure, bool>> logOut() async {
    try {
      final response = await authDataSource.fetchLogout();

      return Right(response.status);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }
}
