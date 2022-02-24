

import 'package:currency_calculator/features/currency_calculator/data/models/currency_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final testCurrencyModel = CurrencyModel(name: "EUR", image: 'assets/images/eur.png');

  test(
    'should be a subclass of Currency model',
        () async {
      // assert
      expect(testCurrencyModel, isA<CurrencyModel>());
    },
  );
}