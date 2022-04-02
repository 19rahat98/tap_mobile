import 'package:tapme/features/language_logic/data/models/language.dart';

abstract class LanguageLogicLocalDataSource{
  Future<LanguageEntity> getLastLanguageCode();
  Future<void> cacheLanguageCode(LanguageEntity languageLogicToCache);
}