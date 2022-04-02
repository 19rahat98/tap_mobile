import 'package:flutter_core/core/abstarct/constant/core_common_contant.dart';
import 'package:tapme/common/constants/global_constant.dart';
import 'package:tapme/common/constants/global_currency_constant.dart';
import 'package:tapme/common/constants/global_regex_constant.dart';
import 'package:tapme/utils/extension/string_ext.dart';

/// TODO: перенести все в extension

/// Форматирует строку под номер телефона
String makeMaskedPhoneNumber(String phoneNumber) {
  final value = phoneNumber?.extractDigits();

  final length = value?.length ?? CoreConstant.zeroInt;
  if (length < 9) {
    return CoreConstant.empty;
  }
  var mode = 0;

  if (value?.length == 10) {
    mode = 1;
  }
  final starPhone = value?.substring(1 - mode, 4 - mode);
  final centerPhone = value?.substring(4 - mode, 7 - mode);
  final preEndNumber = value?.substring(7 - mode, 9- mode);
  final endNumber = value?.substring(9 - mode, value.length);
  return "+7 ($starPhone) $centerPhone $preEndNumber $endNumber";
}

/// форматирует номер телефона для отправки на сервер
/// [phoneNumber] номер телефона
String formatPhoneNumberForSendServer(String phoneNumber) =>
    '+${phoneNumber ?? CoreConstant.empty}';

/// форматирует номер телефона для вывода номера телефона с системного пикетра в [MaskedTextController]
/// [value] номер телефона с пикера
String formatPickPhoneNumber(String value) {
  if (value != null && value.length < 9) {
    return CoreConstant.empty;
  }

  final digits = value.extractDigits();
  return "7${digits.substring(digits.length - 10)}";
}

/// получение символа валюты по названию
String getCurrensySymbol(String currency) {
  switch (currency) {
    case GlobalCurrencyConstant.kzt:
      return GlobalCurrencyConstant.kztSymbol;
    case GlobalCurrencyConstant.usd:
      return GlobalCurrencyConstant.usdSymbol;
    case GlobalCurrencyConstant.eur:
      return GlobalCurrencyConstant.eurSymbol;
    case GlobalCurrencyConstant.rub:
      return GlobalCurrencyConstant.rubSymbol;
    default:
      return currency;
  }
}

/// Получение баланса в нужном формате
/// то есть в виде [### ### ###.##]
String getBalanceFormatted(String balance, {bool addZero = true}) {
  /// Через каждые три символа добавляем space
  balance =
      balance.replaceAll(GlobalRegexConstant.regBalance, GlobalConstant.space);

  /// Если нет точки и addZero является `true`, значит в виде [### ###] идет
  if (!balance.contains(GlobalConstant.point) && addZero) {
    // Добавляем ,00
    return '$balance.00';
  }

  return balance;
}
