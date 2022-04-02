import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// рашришение для [BuildContext]
extension ContextExtension on BuildContext {
  Object? get arguments => ModalRoute.of(this)?.settings.arguments;

  /// TODO: в core
  /// скрывает клавиатуру
  void hideKeyBoard() {
    FocusScope.of(this).unfocus();
  }

  /// TODO: в core
  /// перекидываем на следущие поле в дереве
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild?.context?.widget is! EditableText);
  }

  /// получение аргументов безопастно
  T getArguments<T>() {
    final arguments = ModalRoute.of(this)?.settings.arguments;

    if (arguments is T) {
      return arguments;
    }
    return throw FlutterError(
        'Данные аргумент не является типом ${T.runtimeType}');
  }
}
