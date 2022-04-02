import 'package:dartz/dartz.dart';
import 'package:tapme/core/error/failures.dart';
import 'package:tapme/features/language_logic/data/models/language.dart';
import 'package:tapme/features/language_logic/domain/entities/language_model.dart';

abstract class LanguageLogicRepository{
  Future<Either<Failure, LanguageEntityModel>>
    getConcreteLanguageCode(int langNumber);
  Future<Either<Failure, LanguageEntityModel>> getDefaultLanguageCode();
}