

import 'package:currency_calculator/features/currency_calculator/data/models/converter_response.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

///currency converter repository abstraction
abstract class CurrencyConverterRepository {
  ///method that gets currency converter or failure
  Future<Either<Failure, ConverterResponse>> getCurrencyConverter();
}
