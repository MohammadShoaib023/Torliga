import 'package:intl/intl.dart';

extension TimeStringExtensions on String {
  String toAmPmFormat() {
    try {
      DateTime dateTime = DateFormat("HH:mm").parse(this);
      return DateFormat.jm().format(dateTime);
    } catch (e) {
      return this;
    }
  }
}
