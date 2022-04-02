import 'package:decimal/decimal.dart';


extension IntExtenstion on int {
  /// возвращает отформатированный String для числа с добавлением [0], если число однозначное
  String getTwoDigitNumber() => this.toString().padLeft(2, '0');

  /// приводим int в BigDecimal
  Decimal toDecimal() {
    return Decimal.fromInt(this);
  }
}
