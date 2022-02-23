
import 'package:currency_calculator/core/error/failure.dart';
import 'package:currency_calculator/features/currency_calculator/data/datasources/currency_converter_remote_data_source.dart';
import 'package:currency_calculator/features/currency_calculator/data/models/converter_response.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:http/http.dart' as http;
import '../../../../data/data_reader.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient client;
  late ConverterRemoteDataSourceImpl dataSource;
  var url = Uri.parse('http://data.fixer.io/api/latest?access_key=b641a6e48ddbb9bff685fe3b058136be&symbols=USD&format=1');
  setUp(() {
    client = MockClient();
    dataSource = ConverterRemoteDataSourceImpl(client: client);
  });

  group('get Rate', () {
    test('returns a converter response if the http call completes successfully',
            () async {
          when(client.get(url)).thenAnswer(
                  (_) async => http.Response(dataReader('currency_converter_response.json'), 200));

          expect(await dataSource.getCurrencyRate('USD'), isA<ConverterResponse>());
        });

    test('throws an exception if the http call completes with an error', () {
      when(client.get(url))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(() => dataSource.getCurrencyRate('USD'),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });
}