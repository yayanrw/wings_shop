import 'package:dartz/dartz.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/domain/entities/auth/login_data.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginData>> logIn();
  Future<Either<Failure, bool>> logOut();
}