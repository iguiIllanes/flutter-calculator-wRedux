import '../actions.dart';
import '../reducer.dart';

AppState editHandler(AppState previousState, dynamic action) {
  switch (action) {
    case Edit.AC:
      return const AppState(currentNumber: 0, operacion: "", current: "");
    case Edit.Backspace:
      String previousOperacion = previousState.operacion;
      if (previousOperacion.length <= 1) {
        //TODO FIX
        return AppState(
            currentNumber: 0, operacion: previousOperacion, current: "");
      }
      return AppState(
          currentNumber: num.parse(
              previousOperacion.substring(0, previousOperacion.length - 1)),
          operacion:
              previousOperacion.substring(0, previousOperacion.length - 1),
          current:
              previousOperacion.substring(0, previousOperacion.length - 1));
  }
  return previousState;
}