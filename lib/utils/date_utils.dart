import 'package:flutter_core/core/abstarct/constant/core_common_contant.dart';
import 'package:intl/intl.dart';

int minFromHour(int hour) => hour ~/ 60;

/// Конвертируем дату из одного формата в другой
/// [fromPattern] currentDate дата для которой требуеться конвертация
/// [fromPattern] в каком формате сейчас дата
/// [toPattern] в какой формат нужно перевести дату
String parseDate(
  String currentDate,
  String fromPattern,
  String toPattern,
) {
  try {
    final paredDateTime = DateFormat(fromPattern).parse(currentDate);
    final newDateTime = DateFormat(toPattern).format(paredDateTime);
    return newDateTime;
  } catch (ex) {
    return CoreConstant.empty;
  }
}