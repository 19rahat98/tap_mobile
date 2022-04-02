import 'package:flutter_core/core/abstarct/constant/core_common_contant.dart';
import 'package:tapme/common/constants/global_currency_constant.dart';
import 'package:tapme/config/theme.dart';

/// получение иконки валюты по названию
String getCurrencyIcon(String currency) {
  /// TODO return image path
  return CoreConstant.empty;
  /*switch (currency) {
    case GlobalCurrencyConstant.kzt:
      return AppImage.icKzt;
    case GlobalCurrencyConstant.usd:
      return AppImage.icUsd;
    case GlobalCurrencyConstant.eur:
      return AppImage.icEur;
    case GlobalCurrencyConstant.rub:
      return AppImage.icRub;
    default:
      return CoreConstant.empty;
  }*/
}
