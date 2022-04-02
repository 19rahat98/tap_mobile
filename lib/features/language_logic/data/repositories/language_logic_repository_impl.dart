import 'package:dartz/dartz.dart';
import 'package:tapme/core/error/failures.dart';
import 'package:tapme/features/language_logic/domain/entities/language_model.dart';
import 'package:tapme/features/language_logic/domain/repositories/language_logic_repository.dart';

class LanguageLogicRepositoryImpl implements LanguageLogicRepository{
  @override
  Future<Either<Failure, LanguageEntityModel>> getConcreteLanguageCode(
      int langNumber){
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LanguageEntityModel>> getDefaultLanguageCode() {
    throw UnimplementedError();
  }

}