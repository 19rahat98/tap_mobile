import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/core/utils/mixins/request_worker_mixin.dart';

import 'core_state.dart';

abstract class CoreCubit extends Cubit<CoreState> with CoreRequestWorketMixin {
  List<CoreRequestWorketMixin> _useCaseLaunchers;

  CoreCubit(
    CoreState state, {
    List<CoreRequestWorketMixin> useCaseLaunchers,
  }) : super(state) {
    _useCaseLaunchers = useCaseLaunchers;
    _useCaseLaunchers?.forEach((element) {
      element?.showErrorHttpCallback = (String errorMessage, int code) {
        emit(CoreHttpErrorState(errorMessage, code));
      };

      element?.showAuthErrorCallback = () {
        emit(CoreErrorAuthErrorState());
      };

      element?.showErrorInternetConnection = (error) {
        emit(CoreNotInternetConnectionState(error : error));
      };
      element?.showErrorExeptionCallback = (error) {
        emit(CoreErrorExeptionState(error: error));
      };
    });


    showErrorInternetConnection = (error) {
      emit(CoreNotInternetConnectionState(error : error));
    };

    showAuthErrorCallback = () {
      emit(CoreErrorAuthErrorState());
    };

    showErrorHttpCallback = (String errorMessage, int code) {
      emit(CoreHttpErrorState(errorMessage, code));
    };

    showErrorExeptionCallback = (error) {
      emit(CoreErrorExeptionState(error: error));
    };
  }

  @override
  Future<void> close() {
    _useCaseLaunchers?.forEach((element) {
      element.clear();
    });
    clear();
    return super.close();
  }
}
