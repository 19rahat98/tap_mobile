import 'package:equatable/equatable.dart';

// ignore_for_file: avoid_unused_constructor_parameters
abstract class Failure extends Equatable{
  const Failure([List properties = const <dynamic>[]]) : super();
}

class ServerException extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CacheException implements Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();

}