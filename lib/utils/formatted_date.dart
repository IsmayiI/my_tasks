import 'package:intl/intl.dart';

String formattedDate(String date) {
  final dateTime = DateTime.parse(date);
  final formattedDate = DateFormat('dd-MM-yy').format(dateTime);
  return formattedDate;
}
