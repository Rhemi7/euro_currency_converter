import 'package:equatable/equatable.dart';

class ConverterEntity extends Equatable {
  ConverterEntity({
    this.success,
    this.timestamp,
    this.base,
    this.date,
    this.rates,
  });

  final bool? success;
  final int? timestamp;
  final String? base;
  final DateTime? date;
  final Map<String, double>? rates;

  @override
  // TODO: implement props
  List<Object?> get props => [success, timestamp, base, date, rates];
}
