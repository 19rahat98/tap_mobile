import 'package:flutter/material.dart';
import 'package:flutter_core/core/abstarct/constant/core_common_contant.dart';

/// содержит все ключи локализации
class AppLocale {
  /// ключи локализации
  static const arKey = 'ar';
  static const enKey = 'en';
  static const kkKey = 'kk';
  static const kzKey = 'kz';
  static const ruKey = 'ru';

  /// локализации
  static const ru = Locale(ruKey, CoreConstant.empty);
  static const en = Locale(enKey, CoreConstant.empty);
  static const kz = Locale(kkKey, CoreConstant.empty);

  /// поддерживаемые локализации
  static const supportLocales = [kz, ru, en];
}
