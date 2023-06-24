import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wings_shop/core/utils/errors/exceptions.dart';
import 'package:wings_shop/core/utils/errors/failure.dart';
import 'package:wings_shop/data/datasources/remote/source/transaction_data_source.dart';
import 'package:wings_shop/domain/repositories/transaction_repository.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDataSource transactionDataSource;

  TransactionRepositoryImpl(this.transactionDataSource);

  @override
  Future<Either<Failure, bool>> createTransaction() async {
    try {
      final response = await transactionDataSource.createTransaction();

      return Right(response.status);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Connection failed'));
    }
  }
}
