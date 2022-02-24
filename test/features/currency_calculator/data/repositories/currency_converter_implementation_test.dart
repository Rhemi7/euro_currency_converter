import 'package:currency_calculator/core/error/failure.dart';
import 'package:currency_calculator/core/network_info/network_info.dart';
import 'package:currency_calculator/features/currency_calculator/data/datasources/currency_converter_remote_data_source.dart';
import 'package:currency_calculator/features/currency_calculator/data/models/converter_response.dart';
import 'package:currency_calculator/features/currency_calculator/data/repositories/currency_converter_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockConverterRemoteDataSource extends Mock
    implements ConverterRemoteDataSource {}

void main() {
  late MockConverterRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late CurrencyConverterRepositoryImpl repository;

  mockRemoteDataSource = MockConverterRemoteDataSource();
  mockNetworkInfo = MockNetworkInfo();
  repository = CurrencyConverterRepositoryImpl(
      remoteDataSource: mockRemoteDataSource, networkInfo: mockNetworkInfo);

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('getPosts', () {
    final testConverterModel = ConverterResponse(
        success: true,
        timestamp: 1645629062,
        base: "EUR",
        date: DateTime.parse("2022-02-23"),
        rates: const {"PLN": 4.564393});

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        await repository.getCurrencyConverter('USD');
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getCurrencyRate('USD'))
              .thenAnswer((_) async => testConverterModel);
          // act
          final result = await repository.getCurrencyConverter('USD');
          // assert
          verify(mockRemoteDataSource.getCurrencyRate('USD'));

          expect(result, equals(Right(testConverterModel)));
        },
      );
    });

    test(
      'should return server failure when the call is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getCurrencyRate("USD"))
            .thenThrow(ServerException());
        // act
        final result = await repository.getCurrencyConverter('USD');
        // assert
        verify(mockRemoteDataSource.getCurrencyRate('USD'));
        // verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });


}
