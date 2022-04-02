import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:tapme/core/error/failures.dart';
import 'package:tapme/features/language_logic/domain/entities/language_model.dart';

abstract class UserCase<Type, Parameter>{
  Future<Either<Failure, LanguageEntityModel>> call(Parameter param);

}


class NoParams extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}