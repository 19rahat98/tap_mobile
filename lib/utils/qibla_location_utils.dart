import 'dart:math';

import 'package:vector_math/vector_math.dart' show radians, degrees;

/// выводит градус направления по координатам
/// [currentLatitude] требуемая долгота
/// [currentLongitude] требуемая широта
/// [targetLatitude] текущая долгота
/// [targetLongitude]текущая широта
double getOffsetFromNorth(double currentLatitude, double currentLongitude,
    double targetLatitude, double targetLongitude) {
  var laRad = radians(currentLatitude);
  var loRad = radians(currentLongitude);

  var deLa = radians(targetLatitude);
  var deLo = radians(targetLongitude);

  var toDegrees = degrees(atan(sin(deLo - loRad) /
      ((cos(laRad) * tan(deLa)) - (sin(laRad) * cos(deLo - loRad)))));
  if (laRad > deLa) {
    if ((loRad > deLo || loRad < radians(-180.0) + deLo) &&
        toDegrees > 0.0 &&
        toDegrees <= 90.0) {
      toDegrees += 180.0;
    } else if (loRad <= deLo &&
        loRad >= radians(-180.0) + deLo &&
        toDegrees > -90.0 &&
        toDegrees < 0.0) {
      toDegrees += 180.0;
    }
  }
  if (laRad < deLa) {
    if ((loRad > deLo || loRad < radians(-180.0) + deLo) &&
        toDegrees > 0.0 &&
        toDegrees < 90.0) {
      toDegrees += 180.0;
    }
    if (loRad <= deLo &&
        loRad >= radians(-180.0) + deLo &&
        toDegrees > -90.0 &&
        toDegrees <= 0.0) {
      toDegrees += 180.0;
    }
  }

  return toDegrees;
}
