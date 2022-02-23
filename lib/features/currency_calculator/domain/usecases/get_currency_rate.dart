import 'package:currency_calculator/features/currency_calculator/data/models/converter_response.dart';
import 'package:currency_calculator/features/currency_calculator/domain/repositories/currency_converter_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';

class GetConversionRate extends UseCase<ConverterResponse, Params> {
  final CurrencyConverterRepository currencyConverterRepository;
  GetConversionRate(this.currencyConverterRepository);

  @override
  Future<Either<Failure, ConverterResponse>> call(Params params) async {
    return await currencyConverterRepository.getCurrencyConverter(params.currency);
  }
}


class Params extends Equatable {

  final String currency;

  const Params({required this.currency});

  @override
  // TODO: implement props
  List<Object?> get props => [currency];


}