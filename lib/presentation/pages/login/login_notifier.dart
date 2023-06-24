import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/request_state.dart';
import 'package:wings_shop/domain/entities/user_credentials/user_credentials.dart';
import 'package:wings_shop/domain/repositories/user_credentials_repository.dart';
import 'package:wings_shop/domain/usescases/auth/login.dart';

@injectable
class LoginNotifier extends ChangeNotifier {
  final LogIn logIn;
  final UserCredentialsRepository userCredentialsRepository;

  LoginNotifier(this.logIn, this.userCredentialsRepository);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RequestState _requestState = RequestState.empty;
  String _message = '';

  RequestState get requestState => _requestState;

  String get message => _message;

  Future<bool> isLoggedIn() async {
    try {
      final result = await userCredentialsRepository.getUserCredentials();
      final resultFold = result.fold(
        (failure) {
          _message = failure.message;
          notifyListeners();
          return false;
        },
        (UserCredentials userCredentials) {
          notifyListeners();
          return userCredentials.token.isNotEmpty &&
              userCredentials.token != "N/A";
        },
      );
      return resultFold;
    } catch (e) {
      _message = 'An error occurred: ${e.toString()}';
      notifyListeners();
      return false;
    }
  }

  Future<void> fetchLogin() async {
    try {
      _requestState = RequestState.loading;
      notifyListeners();

      final result = await logIn.exec(
        email: emailController.text,
        password: passwordController.text,
      );

      result.fold(
        (failure) {
          _requestState = RequestState.error;
          _message = failure.message;
          notifyListeners();
        },
        (_) {
          _requestState = RequestState.loaded;
          notifyListeners();
        },
      );
    } catch (e) {
      _requestState = RequestState.error;
      _message = 'An error occurred: ${e.toString()}';
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
