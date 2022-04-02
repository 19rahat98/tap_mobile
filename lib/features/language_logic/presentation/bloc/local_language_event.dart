part of 'local_language_bloc.dart';

@immutable
abstract class LocalLanguageEvent {}

class ToggleLanguageEvent extends LocalLanguageEvent {
  ToggleLanguageEvent(this.language);

  final LanguageEntity language;
}
