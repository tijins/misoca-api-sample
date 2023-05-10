import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

final DateFormat _ymdFormat = DateFormat("yyyy-MM-dd");

class HyphenDateConverter extends JsonConverter<DateTime, String> {
  const HyphenDateConverter();

  @override
  DateTime fromJson(String json) {
    return _ymdFormat.parse(json);
  }

  @override
  String toJson(DateTime date) {
    return _ymdFormat.format(date);
  }
}

class DecimalConverter extends JsonConverter<Decimal, String> {
  const DecimalConverter();

  @override
  Decimal fromJson(String json) {
    return Decimal.parse(json);
  }

  @override
  String toJson(Decimal decimal) {
    return decimal.toString();
  }
}
