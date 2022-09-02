import 'dart:developer';

import 'app_state.dart';

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit() : super(AppState(currentNumber: 0, operations: []));

  AppState previousState = AppState(currentNumber: 0, operations: []);

  // // para poder guardar el estado anterior
  // @override
  // void onChange(Change<AppState> change) {
  //   super.onChange(change);
  //   previousState = change.currentState;
  // }

  void add() {
    log("Cambiando el estado");
    emit(AppState(currentNumber: 420, operations: ["420 "]));
  }
}
