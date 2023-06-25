import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/core/utils/request_state.dart';
import 'package:wings_shop/core/utils/toast_helper.dart';
import 'package:wings_shop/domain/entities/carts/cart.dart';
import 'package:wings_shop/domain/repositories/cart_repository.dart';

@injectable
class CartNotifier extends ChangeNotifier {
  final CartRepository cartRepository;

  CartNotifier(this.cartRepository);

  RequestState _requestState = RequestState.empty;
  String _message = '';
  List<Cart> _carts = [];

  RequestState get requestState => _requestState;

  String get message => _message;

  List<Cart> get carts => _carts;

  Future<void> fetchCarts() async {
    try {
      _requestState = RequestState.loading;
      notifyListeners();

      final Either<Failure, List<Cart>> result =
          await cartRepository.getCarts();

      result.fold(
        (Failure failure) {
          _requestState = RequestState.error;
          _message = failure.message;
          ToastHelper.error(failure.message);
          notifyListeners();
        },
        (List<Cart> success) {
          _requestState = RequestState.loaded;
          _carts = success;
          notifyListeners();
        },
      );
    } catch (e) {
      _requestState = RequestState.error;
      _message = 'An error occurred: ${e.toString()}';
      ToastHelper.error('An error occurred: ${e.toString()}');
      notifyListeners();
    }
  }
}
