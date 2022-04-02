import 'package:tapme/common/constants/global_currency_constant.dart';

class GlobalConstant {
  static const dollar = ' \$';
  static const emptyKzt = '0.0 ${GlobalCurrencyConstant.kztSymbol}';
  static const zeroString = '0';
  static const maskedDigits = "**** ";
  static const space = " ";
  static const appName = 'tap';
  static const appIconKey = "app_icon";
  static const slash = "/";
  static const comma = ',';
  static const point = '.';
  static const double oneDouble = 1.0;
  static const int oneInt = 1;
  static const String positiveValue = '+';
  static const String negativeValue = '-';

  static const defaultLat = 43.23;
  static const defaultLot = 76.88;

  static const maxPinSymbol = 6;
  static const minPinSymbol = 4;

  static const trueValue = 'true';
  static const falseValue = 'false';

  static const iinLength = 12;

  static const double localTimeSession = 10;

  static const otpDuration = 90;

  ///методы расчета высоких широт
  static const angleBased = 'angle';
  static const nightMiddle = 'night';
  static const oneSeventh = 'oneSeventh';
}
