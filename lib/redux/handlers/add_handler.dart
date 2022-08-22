import '../actions.dart';
import '../reducer.dart';

AppState addHandler(AppState previousState, dynamic action) {
  dynamic selectedNumber = 0;
  switch (action) {
    case Add.Zero:
      selectedNumber = 0;
      break;
    case Add.One:
      selectedNumber = 1;
      break;
    case Add.Two:
      selectedNumber = 2;
      break;
    case Add.Three:
      selectedNumber = 3;
      break;
    case Add.Four:
      selectedNumber = 4;
      break;
    case Add.Five:
      selectedNumber = 5;
      break;
    case Add.Six:
      selectedNumber = 6;
      break;
    case Add.Seven:
      selectedNumber = 7;
      break;
    case Add.Eight:
      selectedNumber = 8;
      break;
    case Add.Nine:
      selectedNumber = 9;
      break;
    case Add.Dot:
      if (!previousState.isFloatingPointActive) {
        return AppState(
            currentNumber: previousState.currentNumber + 0.0,
            operacion: "${previousState.operacion}.",
            current: "${previousState.currentNumber}.",
            isFloatingPointActive: true,
            operations: previousState.operations);
      }
      return previousState;
    default:
      return previousState;
  }

  return AppState(
      currentNumber: previousState.isFloatingPointActive
          ? (num.parse("${previousState.current}$selectedNumber"))
          : ((previousState.currentNumber * 10) + selectedNumber),
      operacion: "${previousState.operacion}$selectedNumber",
      current: "${previousState.current}$selectedNumber",
      isFloatingPointActive: previousState.isFloatingPointActive ? true : false,
      operations: previousState.operations);
}
