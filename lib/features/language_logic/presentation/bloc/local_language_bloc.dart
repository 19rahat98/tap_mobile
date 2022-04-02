import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tapme/features/language_logic/data/models/language.dart';

part 'local_language_state.dart';
part 'local_language_event.dart';

class LocalLanguageBloc extends Bloc<LocalLanguageEvent, LocalLanguageState> {
  LocalLanguageBloc() : super(LocalLanguageInitial());

  @override
  Stream<LocalLanguageState> mapEventToState(
    LocalLanguageEvent event,
  ) async* {
    if (event is ToggleLanguageEvent) {
      yield LanguageLoaded(Locale(event.language.code!));
    }
  }
}
