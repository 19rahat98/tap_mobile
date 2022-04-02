import 'package:tapme/features/language_logic/domain/entities/language_model.dart';

class LanguageEntity extends LanguageEntityModel {
  const LanguageEntity({
    required String code,
    required String value,
  }) : super(code: code, value: value);

  //final String? code;
  //final String? value;

  factory LanguageEntity.fromJson(Map<String, dynamic> json) {
    return LanguageEntity(
      code: json['code'].toString(),
      value: json['value'].toString(),
    );
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'code': code, 'value': value};
}

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'ru', value: 'Russian'),
    LanguageEntity(code: 'ru_kz', value: 'Russian'),
  ];
}
