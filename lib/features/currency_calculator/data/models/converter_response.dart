// To parse this JSON data, do
//
//     final converterResponse = converterResponseFromJson(jsonString);

import 'dart:convert';

import 'package:currency_calculator/features/currency_calculator/domain/entity/converter_entity.dart';

ConverterResponse converterResponseFromJson(String str) =>
    ConverterResponse.fromJson(json.decode(str));

String converterResponseToJson(ConverterResponse data) =>
    json.encode(data.toJson());

class ConverterResponse extends ConverterEntity {
  ConverterResponse({
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

  factory ConverterResponse.fromJson(Map<String, dynamic> json) =>
      ConverterResponse(
        success: json["success"],
        timestamp: json["timestamp"],
        base: json["base"],
        date: DateTime.parse(json["date"]),
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "timestamp": timestamp,
        "base": base,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "rates":
            Map.from(rates!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
