import 'package:intl/intl.dart' show DateFormat;

class DateFormats {
  const DateFormats._();

  static DateFormat get dateMonthName => DateFormat('dd MMMM');

  static DateFormat get dateMonthYear => DateFormat('yyyy-MM-dd');
  static DateFormat get monthYear => DateFormat('yyyy-MM');

  static DateFormat get dateMonthNameYear => DateFormat('dd MMMM yyyy');

  static DateFormat get abbrMonthDateYear => DateFormat('MMM, dd, yyyy');

  static DateFormat get hourMinute => DateFormat('HH:mm');

  static DateFormat get hourMinuteMeridiem => DateFormat('HH:mm a');

  static DateFormat get hourMinuteSecond => DateFormat('HH:mm:ss');

  static DateFormat get fullDateFormat => DateFormat("yyyy-MM-dd HH:mm:ss");
  static DateFormat get yyMMddhhmm => DateFormat("yy-MM-dd HH:mm ");
}
