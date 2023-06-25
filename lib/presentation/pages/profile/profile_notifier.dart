import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/toast_helper.dart';
import 'package:wings_shop/domain/entities/user_credentials/user_credentials.dart';
import 'package:wings_shop/domain/repositories/user_credentials_repository.dart';
import 'package:wings_shop/domain/usescases/auth/logout.dart';

@injectable
class ProfileNotifier extends ChangeNotifier {
  final UserCredentialsRepository userCredentialsRepository;
  final LogOut logOut;

  ProfileNotifier(this.userCredentialsRepository, this.logOut);

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

  Future<bool> fetchLogOut() async {
    try {
      notifyListeners();

      final result = await logOut.exec();

      final resultFold = result.fold(
        (failure) {
          ToastHelper.error(failure.message);
          notifyListeners();
          return false;
        },
        (_) {
          notifyListeners();
          return true;
        },
      );

      return resultFold;
    } catch (e) {
      ToastHelper.error('An error occurred: ${e.toString()}');
      notifyListeners();
      return false;
    }
  }
}
