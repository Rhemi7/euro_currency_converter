import 'package:currency_calculator/features/currency_calculator/domain/usecases/get_currency_rate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'converter_state.dart';

class ConverterNotifier extends StateNotifier<ConverterState> {
  GetConversionRate getConversionRate;

  ConverterNotifier(this.getConversionRate) : super(const ConverterInitial());


  Future<void> getRate(String currency) async {
    try {
      state = const ConverterLoading();
      final result = await getConversionRate(Params(currency: currency));
      result.fold((error) => state = ConverterError(message: "Error"), (rate) {


        state = ConverterLoaded(rate: rate.rates?.values.first);
        print('rate ${rate.rates?.values.first}');
      });
    } catch (e) {
      state = ConverterError(message: e.toString());
    }
  }

  ConverterState currentRate() {
    return state;
  }

}