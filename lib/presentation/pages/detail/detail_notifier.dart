import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/core/utils/toast_helper.dart';
import 'package:wings_shop/domain/entities/products/product.dart';
import 'package:wings_shop/domain/repositories/cart_repository.dart';

@injectable
class DetailNotifier extends ChangeNotifier {
  final CartRepository cartRepository;

  DetailNotifier(this.cartRepository);

  Future<void> fetchAddToCart(Product product) async {
    try {
      notifyListeners();
      EasyLoading.show();

      final Either<Failure, bool> result =
          await cartRepository.addCart(product);

      result.fold(
        (Failure failure) {
          print(failure);
          ToastHelper.error(failure.message);
          notifyListeners();
        },
        (bool success) {
          ToastHelper.success("Berhasil ditambahkan ke keranjang");
          notifyListeners();
        },
      );
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      ToastHelper.error('An error occurred: ${e.toString()}');
      notifyListeners();
    }
  }
}
