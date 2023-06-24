import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/core/utils/request_state.dart';
import 'package:wings_shop/core/utils/toast_helper.dart';
import 'package:wings_shop/domain/entities/products/product.dart';
import 'package:wings_shop/domain/repositories/product_repository.dart';
import 'package:wings_shop/domain/usescases/user_credentials/get_token.dart';

@injectable
class HomeNotifier extends ChangeNotifier {
  final ProductRepository productRepository;
  final GetToken getToken;

  HomeNotifier(this.productRepository, this.getToken);

  RequestState _requestState = RequestState.empty;
  String _message = '';
  List<Product> _products = [];

  RequestState get requestState => _requestState;

  String get message => _message;

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    try {
      _requestState = RequestState.loading;
      notifyListeners();

      final Either<Failure, List<Product>> result =
          await productRepository.getProducts();

      result.fold(
        (Failure failure) {
          _requestState = RequestState.error;
          _message = failure.message;
          ToastHelper.error(failure.message);
          notifyListeners();
        },
        (List<Product> success) {
          _requestState = RequestState.loaded;
          _products = success;
          notifyListeners();
        },
      );
    } catch (e) {
      _message = 'An error occurred: ${e.toString()}';
      ToastHelper.error('An error occurred: ${e.toString()}');
      notifyListeners();
    }
  }
}
