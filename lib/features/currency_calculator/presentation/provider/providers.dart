
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:currency_calculator/features/currency_calculator/domain/usecases/get_currency_rate.dart';
import 'package:currency_calculator/features/currency_calculator/presentation/notifier/converter_notifier/converter_notifier.dart';
import 'package:currency_calculator/features/currency_calculator/presentation/notifier/converter_notifier/converter_state.dart';
import '../../../../service_locator.dart';


final converterProvider = Provider<GetConversionRate>((ref) => GetConversionRate(sl()));

final converterNotifierProvider =
StateNotifierProvider<ConverterNotifier, ConverterState>((ref) => ConverterNotifier(
  ref.watch(converterProvider),
));