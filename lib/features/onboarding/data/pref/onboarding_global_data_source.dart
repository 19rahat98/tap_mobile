import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapme/common/constants/global_pref_constant.dart';

/// data source для работы с типом календаря и шапкой на главных страницах
class CoreGlobalOnBoardingDataSource {
  CoreGlobalOnBoardingDataSource(this._sharedPreferences);

  final Future<SharedPreferences> _sharedPreferences;

  /// подтверждаем что пользователь ранее заходил в приложение
  Future<void> confirmBeforeOpenApplication() async {
    final _prefs = await _sharedPreferences;
    await _prefs.setBool(
      GlobalPrefConstant.isBeforeViewOnboarding,
      true,
    );
  }

  /// получаем флаг был ли пользовтель ранее в приложении
  Future<bool> get isBeforeOpenApplication async {
    final _prefs = await _sharedPreferences;
    return _prefs.getBool(GlobalPrefConstant.isBeforeViewOnboarding) ?? false;
  }
}
