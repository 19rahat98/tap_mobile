import 'package:get_it/get_it.dart';
import 'package:tapme/core/sevices/local_storage_servic.dart';

final sl = GetIt.instance;

void initLocator(){
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
  // sl.registerSingleton(UserDataSource(sl.getAsync()));
}

/// для репозиторий
void _repositoryModule() {
  // sl.registerFactory(() => HomeRepository());
}