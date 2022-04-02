import 'package:decimal/decimal.dart';
import 'package:flutter_core/core/abstarct/constant/core_common_contant.dart';
import 'package:intl/intl.dart';
import 'package:tapme/common/constants/global_constant.dart';
import 'package:tapme/common/constants/global_pattern_constant.dart';

extension NumExt on num {
  /// приводим num в BigDecimal
  Decimal get toDecimal {
    final zero = Decimal.fromInt(CoreConstant.zeroInt);

    if (this == null) {
      return zero;
    }
    return Decimal.tryParse(this.toString()) ?? Decimal.zero;
  }

  /// форматирует значение с отступами
  String get moneySpaceFormat {
    final numberFormat = NumberFormat(
        PatternContant.spaceAmountFormat, PatternContant.langAmountFormat);
    final value = numberFormat
        .format(this)
        .replaceAll(GlobalConstant.comma, GlobalConstant.space);
    return value;
  }

  /// Получение баланса в нужном формате
  /// если чисоло положительное тогда добавляется символ плюс [GlobalConstant.positiveValue]
  String get convertPaymentMoneyFormat {
    final convertToStringWithSpace = this.toString().replaceAll(
        GlobalConstant.negativeValue,
        GlobalConstant.negativeValue + GlobalConstant.space);
    if(this < CoreConstant.zeroInt)
      return convertToStringWithSpace;
    return '${GlobalConstant.positiveValue} ${GlobalConstant.space}$this';
  }
}
