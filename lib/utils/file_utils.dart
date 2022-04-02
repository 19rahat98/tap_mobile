import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dart_tags/dart_tags.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/core/abstarct/constant/core_common_contant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tapme/common/constants/global_regex_constant.dart';

/// получает локальный файл по название
/// [nameFile] имя файла
Future<File> getApplicationFile(String nameFile) async {
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  return File('$path/$nameFile');
}

/// получает список файлов в виде путей из заданного директория `direcory`,
/// `fileExtension` - если задан, получает файлы с форматом (пр. mp3)
Future<List<String>> getFilePathsFromDirectory(String directory,
    {String? fileExtension}) async {
  final manifestContent = await rootBundle.loadString('AssetManifest.json');

  final manifestMap = json.decode(manifestContent) as Map<String, dynamic>;

  final paths =
      manifestMap.keys.where((String key) => key.contains(directory)).toList();

  if (fileExtension != null) {
    return paths.where((e) => e.contains(fileExtension)).toList();
  }

  return paths;
}

/// получает название файла из полного пути
String getFileName(String path) => path.split('/').last;

/// получает название звука для передачи в пуш уведомления
/// для `Android` без формата `.mp3`
/// для `iOS` с форматом `.mp3`
String getSoundName(String path) {
  String _result;
  final fileName = getFileName(path);

  if (Platform.isIOS) {
    _result = fileName;
  } else {
    _result =
        fileName.replaceAll(GlobalRegexConstant.mp3Regex, CoreConstant.empty);
  }
  return _result;
}

/// получает название/титул аудиозвука из метаданных файла
Future<String> getSoundTitle(String path) async {
  dynamic title = CoreConstant.empty;

  try {
    final tagProcessor = TagProcessor();

    final data = await rootBundle.load(path);
    final bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    final tagList =
        await tagProcessor.getTagsFromByteArray(Future.value(bytes.toList()));

    title = tagList.first.tags['title'] ?? getSoundName(path);
  } catch (ex) {
    title = getSoundName(path);
  }

  return title as String;
}
