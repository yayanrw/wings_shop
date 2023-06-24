import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/core/utils/network_helper.dart';
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
    return executeSafely<LoginData>(() async {
      final response = await authDataSource.fetchLogin(
        email: email,
        password: password,
      );

      return response.data!.toEntity();
    });
  }

  @override
  Future<Either<Failure, bool>> logOut() async {
    return executeSafely<bool>(() async {
      final response = await authDataSource.fetchLogout();

      return response.status;
    });
  }
}
