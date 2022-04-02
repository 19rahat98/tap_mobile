import 'dart:io';
import 'package:tapme/config/locale.dart';

/// true - если язык поддерживается приложением, иначе false
bool isLanguageSupported(String languageCode) =>
    AppLocale.supportLocales.map((e) => e.languageCode).contains(languageCode);

/// локализация по умолчанию
/// возвращает системную локализацию если она имеется в списке поддерживаемых локализаций,
/// иначе [AppLocale.ru]
String defaultLocale() {
  final systemLanguageCode = Platform.localeName.split('_')[0];

  return isLanguageSupported(systemLanguageCode)
      ? systemLanguageCode
      : AppLocale.ruKey;
}