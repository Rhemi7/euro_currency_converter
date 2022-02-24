import 'dart:convert';
import 'package:currency_calculator/features/currency_calculator/data/models/converter_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../data/data_reader.dart';

void main() {
  final testConverterModel = ConverterResponse(
      success: true,
      timestamp: 1645629062,
      base: "EUR",
      date: DateTime.parse("2022-02-23"),
      rates: const {"PLN": 4.564393});

  test(
    'should be a subclass of Converter Response',
    () async {
      // assert
      expect(testConverterModel, isA<ConverterResponse>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when fromJson is called',
      () async {
        final jsonString = dataReader('currency_converter_response.json');
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        final result = ConverterResponse.fromJson(jsonMap);
        expect(result, testConverterModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = testConverterModel.toJson();
        // assert
        final expectedMap = {
          "success": true,
          "timestamp": 1645629062,
          "base": "EUR",
          "date": "2022-02-23",
          "rates": {"PLN": 4.564393}
        };
        expect(result, expectedMap);
      },
    );
  });
}
