

import 'package:currency_calculator/core/usecases/usecases.dart';
import 'package:currency_calculator/features/currency_calculator/data/models/converter_response.dart';
import 'package:currency_calculator/features/currency_calculator/domain/repositories/currency_converter_repository.dart';
import 'package:currency_calculator/features/currency_calculator/domain/usecases/get_currency_rate.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCurrencyConverterRepository extends Mock implements CurrencyConverterRepository {}

void main() {
  MockCurrencyConverterRepository repository;
  GetConversionRate usecase;
  final testConverterModel = ConverterResponse(
    success: true,
    timestamp: 1645629062,
    base: "EUR",
    date: DateTime.parse("2022-02-23"),
    rates: const {"PLN": 4.564393},);

  test(
    'should get converter response from the repository',
        () async {
      repository = MockCurrencyConverterRepository();
      usecase = GetConversionRate(repository);
      //stub the method
      when(repository.getCurrencyConverter('USD')).thenAnswer((_) async => Right(testConverterModel));
      // act
      final result = await usecase( const Params(currency: 'USD'));
      // assert
      expect(result, Right(testConverterModel));
      verify(repository.getCurrencyConverter('USD'));
      verifyNoMoreInteractions(repository);
    },
  );
}