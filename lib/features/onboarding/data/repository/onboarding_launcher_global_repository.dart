import 'package:flutter_core/core/di/core_locator.dart';
import 'package:tapme/features/onboarding/data/pref/onboarding_global_data_source.dart';

/// репозиторий для работы с процесами при запуске приложения
class CoreGlobalOnboardingLauncherRepository {
  CoreGlobalOnboardingLauncherRepository() : _globalLauncherDataSource = sl();

  final CoreGlobalOnBoardingDataSource _globalLauncherDataSource;

  /// получаем флаг был ли пользовтель ранее в приложении
  Future<bool> get isBeforeOpenApplication =>
      _globalLauncherDataSource.isBeforeOpenApplication;

  /// подтверждаем что пользователь ранее заходил в приложение
  void confirmBeforeOpenApplication() =>
      _globalLauncherDataSource.confirmBeforeOpenApplication();
}
