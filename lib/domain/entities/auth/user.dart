import 'package:equatable/equatable.dart';
import 'package:wings_shop/data/datasources/remote/dtos/auth/user_dto.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String role;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        role,
      ];
}

extension UserDtoExt on UserDto {
  User toEntity() {
    return User(
      id: id ?? 0,
      name: name ?? "N/A",
      email: email ?? "N/A",
      role: role ?? "N/A",
    );
  }
}
