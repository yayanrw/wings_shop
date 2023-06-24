import 'package:injectable/injectable.dart';
import 'package:wings_shop/domain/repositories/user_credentials_repository.dart';

@lazySingleton
class GetToken {
  final UserCredentialsRepository userCredentialsRepository;

  GetToken(this.userCredentialsRepository);

  Future<String?> exec() async {
    final response = await userCredentialsRepository.getUserCredentials();

    final userCredentials = response.fold(
      (failure) => null,
      (data) => data,
    );

    if (userCredentials != null) {
      return userCredentials.token;
    } else {
      return null;
    }
  }
}
