import 'package:intl/intl.dart';

class DateTimeHelper {
  DateTimeHelper._();
  static String formatDate(DateTime dateTime,) {
    final DateFormat formatter = DateFormat('MMM dd, yyyy',);
    String formattedDate = formatter.format(dateTime,);
    return formattedDate;
  }
}