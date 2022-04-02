import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_core/core/abstarct/constant/core_common_contant.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:tapme/core/app/view/app.dart';

/// получение device id для каждой платформы
/// TODO: в core
Future<String> getDeviceId() async {
  final deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    final iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor ?? CoreConstant.empty; // unique ID on iOS
  } else {
    final androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId ?? CoreConstant.empty; // unique ID on Android
  }
}

/// сохраняем уникального id(UUID) в Связке ключей.
/// Таким образом вы можете установить уникальный идентификатор для своего устройства.
Future<String> getSyncUniqueDeviceId() async {
  final uuid = await FlutterKeychain.get(key: 'uuid');
  if (uuid == null) {
    await FlutterKeychain.put(key: 'uuid', value: await getDeviceId());
  }
  return await FlutterKeychain.get(key: 'uuid') ?? CoreConstant.empty;
}

/// получение название модели девайса
Future<String> getDeviceName() async {
  final deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    return androidInfo.model ?? CoreConstant.empty;
  } else {
    final iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.utsname.machine ?? CoreConstant.empty;
  }
}

/// возвращает флаг является ли девайс Xiaomi
Future<bool> isDeviceXiaomi() async {
  if (!Platform.isAndroid) return false;

  final deviceInfo = DeviceInfoPlugin();
  final info = await deviceInfo.androidInfo;

  return info.manufacturer?.toLowerCase().contains('xiaomi') ?? false;
}

/// возвращает версию операционной системы
Future<String> getOSVersion() async {
  final deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    return '${androidInfo.version.sdkInt}';
  } else {
    final iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.systemVersion ?? CoreConstant.empty;
  }
}

/// возвращает fingerprint девайса (пр. "mobile/1b4dc3ba2a2e752a/Android/28/2.0.7/28")
Future<String> getDeviceFingerprint() async {
  final deviceId = await getDeviceId();
  final osName = Platform.operatingSystem;
  final osVersion = await getOSVersion();
  final appVersion = packageInfo.version;
  final appBuildNumber = packageInfo.buildNumber;

  return 'mobile/$deviceId/$osName/$osVersion/$appVersion/$appBuildNumber';
}
