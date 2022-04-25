import 'package:flutter_core/core/di/core_locator.dart';
import 'package:flutter_core/core/domain/abstract/use_case/core_use_case.dart';
import 'package:tapme/common/data/repository/global_settings_repositpry.dart';
import 'package:tapme/features/onboarding/data/repository/onboarding_launcher_global_repository.dart';

/// выполняет действия при входе в приложение
class GlobalMakeActionInputApplicationUseCase
    extends CoreFutureNoneParamUseCase<GlobalMakeActionInputApplicationResult> {
  GlobalMakeActionInputApplicationUseCase()
      : _launcherRepository = sl(),
        _settingsRepository = sl();

  final GlobalSettingsRepository _settingsRepository;
  final CoreGlobalOnboardingLauncherRepository _launcherRepository;

  @override
  Future<GlobalMakeActionInputApplicationResult> execute() async {
    /// запрашиваем, впервые ли пользователь в приложении
    final isBeforeOpenApplication =
        await _launcherRepository.isBeforeOpenApplication;

    /// если пользователь ранее не был в приложении
    if (!isBeforeOpenApplication) {
      /// записываем его первичное действие
      _launcherRepository.confirmBeforeOpenApplication();

      /// очищаем хранилище с персональными данными
      /// в IOS локальный key chain хранит данные даже после удаления приложения
      //_launcherRepository.clearAllUserData();
    }

    /// вовзвращает флаг есть ли лакация пользователя в хранилиже
    final isEmptyLocation = _settingsRepository.loadLocationSetting;

    return GlobalMakeActionInputApplicationResult(
      isBeforeOpenApplication: isBeforeOpenApplication,
      isEmptyLocation: isEmptyLocation,
    );
  }
}

/// результат для [GlobalMakeActionInputApplicationUseCase]
class GlobalMakeActionInputApplicationResult {
  GlobalMakeActionInputApplicationResult({
    required this.isBeforeOpenApplication,
    this.isViewBeforeOnboarding,
    this.isEmptyLocation,
  });

  final bool isBeforeOpenApplication;
  final bool? isViewBeforeOnboarding;
  final bool? isEmptyLocation;
}

/// регистрируем просмотр онбординга
class GlobalRegisterViewOnboardingUseCase
    extends CoreFutureNoneParamUseCase<void> {
  GlobalRegisterViewOnboardingUseCase() : _launcherRepository = sl();

  final CoreGlobalOnboardingLauncherRepository _launcherRepository;


  @override
  Future<void> execute() async {
    return _launcherRepository.confirmBeforeOpenApplication();
  }
}
