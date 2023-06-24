import 'package:dartz/dartz.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/domain/entities/auth/login_data.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginData>> logIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, bool>> logOut();
}
