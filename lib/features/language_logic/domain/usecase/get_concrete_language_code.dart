import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tapme/core/error/failures.dart';
import 'package:tapme/core/usecases/usecases.dart';
import 'package:tapme/features/language_logic/domain/entities/language_model.dart';
import 'package:tapme/features/language_logic/domain/repositories/language_logic_repository.dart';

class GetConcreteLanguageCode implements UserCase<LanguageEntityModel, Params> {
  GetConcreteLanguageCode(this.repository);

  final LanguageLogicRepository repository;

  @override
  Future<Either<Failure, LanguageEntityModel>> call(Params params) async =>
      repository.getConcreteLanguageCode(params.languageCode);
}

class Params extends Equatable{
  const Params({required this.languageCode}) : super();

  final int languageCode;

  @override
  List<Object?> get props => throw UnimplementedError();

}
