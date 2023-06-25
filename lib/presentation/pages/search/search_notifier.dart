import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/core/utils/request_state.dart';
import 'package:wings_shop/domain/entities/products/product.dart';
import 'package:wings_shop/domain/repositories/product_repository.dart';

@injectable
class SearchNotifier extends ChangeNotifier {
  final ProductRepository productRepository;
  SearchNotifier(this.productRepository);

  RequestState _requestState = RequestState.empty;
  String _message = '';
  List<Product> _products = [];
  String _searchText = '';


  RequestState get requestState => _requestState;

  String get message => _message;

  List<Product> get products => _products;

  Future<void> fetchProductSearch() async {
    _requestState = RequestState.loading;
    notifyListeners();

    final Either<Failure, List<Product>> result =
    await productRepository.getProducts(_searchText);

    result.fold(
          (Failure failure) {
        _requestState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
          (List<Product> success) {
        _requestState = RequestState.loaded;
        _products = success;
        notifyListeners();
      },
    );
  }

  Future<void> searchProducts(String text) async {
    _searchText = text;
    notifyListeners();
    await fetchProductSearch();
  }

  Future<void> setNull() async {
    _products = <Product>[];
    _message = '';
    notifyListeners();
  }
}