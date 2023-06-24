import 'package:dartz/dartz.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';

abstract class TransactionRepository {
  Future<Either<Failure, bool>> createTransaction();
}
