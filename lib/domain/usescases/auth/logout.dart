import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/domain/repositories/auth_repository.dart';
import 'package:wings_shop/domain/repositories/user_credentials_repository.dart';

@lazySingleton
class LogOut {
  final AuthRepository authRepository;
  final UserCredentialsRepository userCredentialsRepository;

  LogOut(this.authRepository, this.userCredentialsRepository);

  Future<Either<Failure, bool>> exec() async {
    final response = await authRepository.logOut();
    await userCredentialsRepository.clearUserCredentials();

    return response;
  }
}
