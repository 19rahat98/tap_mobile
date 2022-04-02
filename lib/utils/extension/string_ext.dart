import 'package:decimal/decimal.dart';
import 'package:flutter_core/core/abstarct/constant/core_common_contant.dart';
import 'package:tapme/common/constants/global_constant.dart';
import 'package:tapme/common/constants/global_regex_constant.dart';
import 'package:tapme/utils/string_utils.dart';

extension StringExtension on String {
  /// переводим строку в double
  double toDouble() {
    try {
      return double.parse(this.extractSpaces());
    } catch (ex) {
      return CoreConstant.zeroDouble;
    }
  }

  /// обрезаем строку
  String ellipsize(int limit) {
    if (this.length > limit) {
      return this.substring(0, limit) + '...';
    } else {
      return this;
    }
  }

  /// получает только цифры из строки
  String extractDigits() =>
      this.replaceAll(GlobalRegexConstant.regDigits, CoreConstant.empty);

  /// получает только цифры из строки
  String replaceIncorrectQuotes() => this.replaceAll("ʿ", "`");

  /// сравнивает длину строки с [limit]
  bool isEllipsible(int limit) => this.length > limit;

  /// получаем bool значение во стринга
  bool isBoolean() => this.toLowerCase() == 'true' ? true : false;

  Decimal toDecimal() {
    final zero = Decimal.tryParse("0");

    if (this == null || this.isEmpty) {
      return zero!;
    }
    return Decimal.tryParse(this.replaceAll(" ", CoreConstant.empty)) ?? zero!;
  }

  /// обрезает только лишние нули после запятой
  String truncateDecimals() {
    final decimal = this.toDecimal();
    return decimal.toString();
  }

  /// Возвращает символ валюты по коду с сервера
  String get currencySymbol => getCurrensySymbol(this);

  /// Возвращает фамилию и первую букву имени по цельному полю ФИО
  String get extractShortFio {
    final isEmpty = this?.isEmpty ?? true;
    if (isEmpty) return CoreConstant.empty;
    List<String> fio = this.split(GlobalConstant.space);

    final shortName = fio.length > 1 && fio[1].isNotEmpty
        ? GlobalConstant.space + fio[1].substring(0, 1) + GlobalConstant.point
        : CoreConstant.empty;

    return fio[0] + shortName;
  }

  /// начинает с заглавной буквы
  String capitalize() {
    if (this.isNotEmpty && this.length > CoreConstant.zeroInt)
      return "${this[0].toUpperCase()}${this.substring(1)}";
    return CoreConstant.empty;
  }

  /// удаляет со строки пробелы
  String extractSpaces() =>
      this.replaceAll(GlobalConstant.space, CoreConstant.empty);

  /// удаляет со строки запятые
  String extractCommas() =>
      this.replaceAll(GlobalConstant.comma, CoreConstant.empty);
}
