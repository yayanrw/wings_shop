import 'package:intl/intl.dart';

extension IntFormatter on int {
  String format() {
    return NumberFormat('#,##0').format(this);
  }
}

extension DoubleFormatter on double {
  String format() {
    return NumberFormat('#,##0').format(this);
  }
}
