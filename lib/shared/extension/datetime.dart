import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate => '$year-$month-$day';
  String get timeOnly => DateFormat('HH:mm a').format(this);
}
