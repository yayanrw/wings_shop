import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/toast_helper.dart';
import 'package:wings_shop/domain/entities/user_credentials/user_credentials.dart';
import 'package:wings_shop/domain/repositories/user_credentials_repository.dart';

@injectable
class ProfileNotifier extends ChangeNotifier {
  final UserCredentialsRepository userCredentialsRepository;

  ProfileNotifier(this.userCredentialsRepository);

  UserCredentials _userCredentials =
      const UserCredentials(id: 0, name: "N/A", email: "N/A", token: "N/A");

  UserCredentials get userCredentials => _userCredentials;

  Future<void> fetchUserCredentials() async {
    final result = await userCredentialsRepository.getUserCredentials();

    result.fold((l) {
      ToastHelper.error(l.message);
      notifyListeners();
    }, (r) {
      _userCredentials = r;
      notifyListeners();
    });
  }
}
