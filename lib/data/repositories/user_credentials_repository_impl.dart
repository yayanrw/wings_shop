import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/data/datasources/local/source/user_credentials_data_source.dart';
import 'package:wings_shop/domain/entities/user_credentials/user_credentials.dart';
import 'package:wings_shop/domain/repositories/user_credentials_repository.dart';

@LazySingleton(as: UserCredentialsRepository)
class UserCredentialsRepositoryImpl implements UserCredentialsRepository {
  final UserCredentialsDataSource userCredentialsDataSource;

  UserCredentialsRepositoryImpl(this.userCredentialsDataSource);

  @override
  Future<Either<Failure, bool>> clearUserCredentials() async {
    try {
      return Right(await userCredentialsDataSource.clearUserCredentials());
    } catch (e) {
      return Left(ApplicationFailure("Failed: $e"));
    }
  }

  @override
  Future<Either<Failure, UserCredentials>> getUserCredentials() async {
    try {
      final response = await userCredentialsDataSource.getUserCredentials();
      return Right(response.toEntity());
    } catch (e) {
      return Left(ApplicationFailure("Failed: $e"));
    }
  }

  @override
  Future<Either<Failure, bool>> setUserCredentials(
    UserCredentials userCredentials,
  ) async {
    try {
      return Right(await userCredentialsDataSource.clearUserCredentials());
    } catch (e) {
      return Left(ApplicationFailure("Failed: $e"));
    }
  }
}
