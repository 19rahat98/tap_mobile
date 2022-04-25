// ignore_for_file: cascade_invocations

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapme/common/data/repository/global_settings_repositpry.dart';
import 'package:tapme/core/sevices/local_storage_servic.dart';
import 'package:tapme/features/onboarding/data/pref/onboarding_global_data_source.dart';
import 'package:tapme/features/onboarding/data/repository/onboarding_launcher_global_repository.dart';

final sl = GetIt.instance;

void initLocator() {
  _commonModule();
  _localStorageModule();
  _apiServiceModule();
  _dataSourceModule();
  _repositoryModule();
}

/// для общих зависимостей
// ignore: avoid_void_async
void _commonModule() async {
  /// Shared preferences
  final sharedPreferences = SharedPreferences.getInstance();
  sl.registerSingletonAsync(() => sharedPreferences);
}

Future _localStorageModule() async {
  //var instance = await LocalStorageService.getInstance();
  //sl.registerSingleton<LocalStorageService>(instance!);
  sl.registerSingleton<LocalStorageService>(await LocalStorageService().init());
}

Future _apiServiceModule() async {
  //sl.registerLazySingleton(() => NetworkCall());
}

/// для локального хранения данных
Future<void> _dataSourceModule() async {
  sl.registerFactory(() => CoreGlobalOnBoardingDataSource(sl.getAsync()));
}

/// для репозиторий
void _repositoryModule() {
  sl.registerFactory(() => GlobalSettingsRepository());
  sl.registerFactory(() => CoreGlobalOnboardingLauncherRepository());
}