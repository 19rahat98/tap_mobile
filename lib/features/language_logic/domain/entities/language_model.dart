import 'package:equatable/equatable.dart';

class LanguageEntityModel extends Equatable {
  const LanguageEntityModel({
    required this.code,
    required this.value,
  }) : super();

  final String? code;
  final String? value;

  @override
  List<Object?> get props => throw UnimplementedError();
}
