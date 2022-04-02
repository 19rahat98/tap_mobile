import 'package:flutter_core/core/abstarct/constant/core_common_contant.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tapme/utils/location_utils.dart';

/// mixin который слушает изменение местопложения девайса
mixin LocationMixin {
  /// текущее местоположение
  late Position locationData;

  /// слушает местоположение девайса
  Future<void> listenLocationChange() async {
    final isGrantedPermission = await hasPermission;
    if (isGrantedPermission) {
      Geolocator.getPositionStream().listen((locationData) {
        this.locationData = locationData;
      });
    }
  }

  /// запрашивает разрешение на местоположение и возвращает результат
  Future makeLocationRequestPermission({
    int delay = CoreConstant.zeroInt,
    Function(Position? locationData)? resultPermission,
    Function()? deniedForever,
    Function()? denied,
    Function()? serviceDisabled,
    Function()? awaiting,
  }) async {
    LocationPermission permission;

    /// Ждёт разрешение
    awaiting?.call();
    return Future<void>.delayed(Duration(milliseconds: delay), () async {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        // Разрешение на всегда закрыты.
        deniedForever?.call();
        return;
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          // Разрешение на всегда закрыты.
          deniedForever?.call();
          return;
        }

        if (permission == LocationPermission.denied) {
          /// Разрешение было отклонено
          denied?.call();
          return;
        }
      }

      /// Если геолокация была отключена
      final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        serviceDisabled?.call();
        return;
      }

      /// отдает последнее местополжение пользователя
      /// чтобы страница долго не ждала
      resultPermission?.call(await Geolocator.getLastKnownPosition());
    });
  }
}
