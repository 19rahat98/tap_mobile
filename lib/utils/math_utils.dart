import 'dart:math' as math;

/// получаем угол из градусов
double getAngle(double heading) => ((heading ?? 0) * (math.pi / 180) * -1);
