import 'dart:math';
import 'package:flutter_core/core/abstarct/constant/core_common_contant.dart';
import 'package:geolocator/geolocator.dart';

/// получает текущее местоположение
Future<Position> get currentPosition async {
  final isGrantedPermission = await hasPermission;
  if (isGrantedPermission) {
    return Geolocator?.getCurrentPosition();
  } else {
    return Position(
      longitude: CoreConstant.zeroDouble,
      latitude: CoreConstant.zeroDouble,
      timestamp: DateTime.now(),
      accuracy: CoreConstant.zeroDouble,
      altitude: CoreConstant.zeroDouble,
      heading: CoreConstant.zeroDouble,
      speed: CoreConstant.zeroDouble,
      speedAccuracy: CoreConstant.zeroDouble,
    );
  }
}

Future<bool> get hasPermission async {
  final permission = await Geolocator.checkPermission();
  return permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always;
}

/// высчитываем дистанцию локально
int getDistanceByCoordinate(
    double lat1, double lon1, double lat2, double lon2) {
  final theta = lon1 - lon2;
  var dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) +
      cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta));
  dist = acos(dist);
  dist = rad2deg(dist);
  dist = dist * 60 * 1.1515;
  return dist.round();
}

double deg2rad(double deg) {
  return deg * pi / 180.0;
}

double rad2deg(double rad) {
  return rad * 180.0 / pi;
}

/// получение название города по локации
/*Future<String> getNameCityByCoordinate(double lat, double lot) async {
  if (lat == 0 || lot == 0) {
    return CoreConstant.empty;
  }
  final coordinates = Coordinates(lat, lot);
  try {
    final addresses =
        await Geocoder?.local?.findAddressesFromCoordinates(coordinates);
    final first = addresses?.first;
    return first?.locality ?? first?.adminArea ?? CoreConstant.empty;
  } catch (_) {
    return CoreConstant.empty;
  }
}

/// получение название страны по локации
Future<String> getNameCountryByCoordinate(double lat, double lot) async {
  if (lat == 0 || lot == 0 || lat == null || lot == null)
    return CoreConstant.empty;
  final coordinates = Coordinates(lat, lot);
  try {
    final countries =
        await Geocoder?.local?.findAddressesFromCoordinates(coordinates);
    final first = countries?.first;
    return first?.countryName ?? first?.countryName ?? CoreConstant.empty;
  } catch (_) {
    return CoreConstant.empty;
  }
}

/// получение название улицы по локации
Future<String> getNameStreetByCoordinate(double lat, double lot) async {
  if (lat == 0 || lot == 0 || lat == null || lot == null)
    return CoreConstant.empty;
  try {
    final coordinates = new Coordinates(lat, lot);
    final addresses =
        await Geocoder?.local?.findAddressesFromCoordinates(coordinates);
    final first = addresses?.first;

    return first?.featureName ?? CoreConstant.empty;
  } catch (_) {
    return CoreConstant.empty;
  }
}*/
