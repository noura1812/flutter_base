import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toHourMinute(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    return DateFormat.jm(myLocale.toString()).format(this);
  }

  String toMonthYear(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    return DateFormat.yMMMM(myLocale.toString()).format(this);
  }
}

extension TimeOfDayExtension on TimeOfDay {
  DateTime timeToDate() {
    TimeOfDay t = this;
    final now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      t.hour,
      t.minute,
    );
  }
}
