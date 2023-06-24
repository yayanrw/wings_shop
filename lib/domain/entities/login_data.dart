import 'package:equatable/equatable.dart';
import 'package:wings_shop/data/datasources/remote/dtos/auth/login_data_dto.dart';
import 'package:wings_shop/domain/entities/user.dart';

class LoginData extends Equatable {
  final User user;
  final String token;

  const LoginData({
    required this.user,
    required this.token,
  });

  @override
  List<Object?> get props => [
        user,
        token,
      ];
}

extension LoginDataDtoExt on LoginDataDto {
  LoginData toEntity() {
    return LoginData(
      user: user?.toEntity() ??
          const User(
            id: 0,
            name: "N/A",
            email: "N/A",
            role: "N/A",
          ),
      token: token ?? "N/A",
    );
  }
}
