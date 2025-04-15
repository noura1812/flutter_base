import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

class IntToBoolConverter extends JsonConverter<bool, int> {
  const IntToBoolConverter();

  @override
  bool fromJson(json) {
    return json == 1;
  }

  @override
  int toJson(bool object) {
    return object ? 1 : 0;
  }
}

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    DateTime date = DateFormat('HH:mm:ss').parse(json);
    return DateTime(DateTime.now().year, DateTime.now().month, date.day,
        date.hour, date.minute);
  }

  @override
  String toJson(DateTime time) =>
      '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
}

class StringToIntConverter extends JsonConverter<int?, String?> {
  const StringToIntConverter();

  @override
  int? fromJson(String? json) {
    return json == null ? null : num.tryParse(json)?.toInt();
  }

  @override
  String? toJson(int? object) {
    return object?.toString();
  }
}
