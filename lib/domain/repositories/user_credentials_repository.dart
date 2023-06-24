import 'package:dartz/dartz.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/domain/entities/user_credentials/user_credentials.dart';

abstract class UserCredentialsRepository {
  Future<Either<Failure, UserCredentials>> getUserCredentials();

  Future<Either<Failure, bool>> setUserCredentials(
    UserCredentials userCredentials,
  );

  Future<Either<Failure, bool>> clearUserCredentials();
}
