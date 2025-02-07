import 'package:intl/intl.dart';


/// Date Time conversion
extension DateTimeExtensions on String {
  String get dateTimeConversion {
    DateTime? dateTime = DateTime.tryParse(this);
    if (dateTime != null) {
      return DateFormat("dd-MMM-yyyy hh:mm a").format(dateTime.toLocal());
    }
    return '';
  }
}


/// String amount to double conversion
extension AmountParsing on String? {
  double get parsedAmount => double.tryParse(this ?? '0') ?? 0.0;
}

