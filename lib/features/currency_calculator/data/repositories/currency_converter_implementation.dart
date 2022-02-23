
import 'package:currency_calculator/core/error/failure.dart';
import 'package:currency_calculator/features/currency_calculator/data/models/converter_response.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network_info/network_info.dart';
import '../../domain/repositories/currency_converter_repository.dart';
import '../datasources/currency_converter_remote_data_source.dart';

class CurrencyConverterRepositoryImpl implements CurrencyConverterRepository {
  CurrencyConverterRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  final ConverterRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;


  @override
  Future<Either<Failure, ConverterResponse>> getCurrencyConverter(String currency) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteDrinks = await remoteDataSource.getCurrencyRate(currency);

        return Right(remoteDrinks);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}