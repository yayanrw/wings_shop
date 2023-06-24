import 'package:dartz/dartz.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/domain/entities/auth/login_data.dart';
import 'package:wings_shop/domain/entities/user_credentials/user_credentials.dart';
import 'package:wings_shop/domain/repositories/auth_repository.dart';
import 'package:wings_shop/domain/repositories/user_credentials_repository.dart';

class logIn {
  final AuthRepository authRepository;
  final UserCredentialsRepository userCredentialsRepository;

  logIn(this.authRepository, this.userCredentialsRepository);

  Future<Either<Failure, LoginData>> exec({
    required String email,
    required String password,
  }) async {
    final response =
        await authRepository.logIn(email: email, password: password);

    final loginData = response.fold(
      (failure) => null,
      (data) => data,
    );

    if (loginData != null) {
      await userCredentialsRepository
          .setUserCredentials(loginData.toUserCredentials());
    }

    return response;
  }
}
