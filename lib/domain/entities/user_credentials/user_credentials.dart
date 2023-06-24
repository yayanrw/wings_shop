import 'package:equatable/equatable.dart';
import 'package:wings_shop/data/datasources/local/daos/user_credentials_dao.dart';
import 'package:wings_shop/domain/entities/auth/login_data.dart';

class UserCredentials extends Equatable {
  final int id;
  final String name;
  final String email;
  final String token;

  const UserCredentials({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        token,
      ];
}

extension UserCredentialsDaoExt on UserCredentialsDao {
  UserCredentials toEntity() {
    return UserCredentials(
      id: id ?? 0,
      name: name ?? "N/A",
      email: email ?? "N/A",
      token: token ?? "N/A",
    );
  }
}

extension LoginDataExt on LoginData {
  UserCredentials toUserCredentials() {
    return UserCredentials(
      id: user.id,
      name: user.name,
      email: user.email,
      token: token,
    );
  }
}
