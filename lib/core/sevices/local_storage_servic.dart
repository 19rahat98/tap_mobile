import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  late SharedPreferences? _preferences;


  Future<LocalStorageService> init() async{
    _preferences = await SharedPreferences.getInstance();
    return LocalStorageService();
  }

  void saveToDisk(String key,dynamic content) {
    log(
        '(TRACE) LocalStorageService:_saveStringToDisk.'
            ' key: $key value: $content');
    if (content is String) {
      _preferences!.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }
  }

  bool containsKey(String key){
    log('(TRACE) LocalStorageService:containsKey. key: $key, value:'
        ' ${_preferences!.containsKey(key)}');
    return _preferences!.containsKey(key);
  }

  dynamic getFromDisk(String key) {
    final value = _preferences!.get(key);
    log('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  dynamic getListFromDisk(String key) {
    final value = _preferences!.getStringList(key);
    log('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void removeDataByKey(String key){
    log('(TRACE) LocalStorageService:_removed. key: $key');
    _preferences!.remove(key);
  }

}