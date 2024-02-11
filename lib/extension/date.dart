import 'package:intl/intl.dart';

extension DateConversion on DateTime {
  String toMonth() {
    return DateFormat("MMMM").format(this);
  }

  String toDateCollectionId() {
    return DateFormat("MMMM-yyyy").format(this);
  }
}
